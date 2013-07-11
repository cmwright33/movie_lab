class MoviesController < ApplicationController

def index
    if params[:search]
      @search_results = Imdb::Movie.search(params[:search])
    end
  end

  def show
    @movie = Imdb::Movie.new(params[:id])
  end

  def create
    fav_movie = Imdb::Movie.new(params[:id])
    fav_movie.title
    fav_movie.director
    fav_movie.poster
    fav_movie.year
    fav_movie.plot
    fav_movie.mpaa_rating
    fav_movie.rating
    fav_movie.save
end




