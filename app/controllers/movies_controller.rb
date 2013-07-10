class MoviesController < ApplicationController

  def index
    # @movie = Imdb::Movie.new("0095016")
    #@movies = Movie.all
    @movie_search = Imdb::Search.new(params[:movie])
  end

  def create

  end

  def new

  end


end


