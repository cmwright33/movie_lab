class MoviesController < ApplicationController

  def index
    @movie = Imdb::Search.new("Star Trek")

  end



end