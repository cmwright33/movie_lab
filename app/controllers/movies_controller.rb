class MoviesController < ApplicationController

def index
    if params[:search]
      @search_results = Imdb::Movie.search(params[:search])
    end
  end

  def show
    @movie = Imdb::Movie.new(params[:id])
  end

end




