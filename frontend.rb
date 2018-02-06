require 'unirest'

while true
  system "clear"
  print "Enter search term: "
  input_search_term = gets.chomp
  response = Unirest.get("http://localhost:3000/articles?search=#{input_search_term}")
  articles = response.body["response"]["docs"]

  articles.each do |article|
    puts "=" * 50
    puts article["web_url"]
    puts
    puts article["headline"]["print_headline"]
    puts
    puts article["source"]
    puts
    puts"-" * 50
  end

  puts "press enter to continue or q to quit"
  input_choice = gets.chomp
  if input_choice == 'q'
    exit
  end
end