class ArticlesController < ApplicationController
  def index 
    search_term = params[:search]
    @articles = Unirest.get("https://api.nytimes.com/svc/search/v2/articlesearch.json?api-key=#{ENV["API_KEY"]}").body
    # never git commit with API key in code!!!!!
    # ENV stands for environment variable. environment variables are always uppercase with underscores. 
    render json: @articles
  end
end

