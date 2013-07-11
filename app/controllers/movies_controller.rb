class MoviesController < ApplicationController


  def index
      @search_results = Imdb::Search.new(params[:search]).movies[0..9]
  end

  def show
    @movie = Imdb::Search.new(params[:id])
  end

  def create
    new_movie = Movie.new
    new_movie.title = params[:title]
    new_movie.director = params[:director]
    new_movie.year = params[:year]
    new_movie.poster = params[:poster]
    new_movie.plot = params[:plot]
    new_movie.mpaa_rating = params[:mpaa_rating]
    new_movie.rating = params[:rating]
  end

  def add_favorite
    # movie = Movie.find(params[:id])
    id = params[:id]
    movie = Movie.new
    movie.id = id
    movie.title = Imdb::Movie.new(id).title
    movie.year = Imdb::Movie.new(id).year
    movie.director = Imdb::Movie.new(id).director.first
    movie.poster = Imdb::Movie.new(id).poster
    movie.plot = Imdb::Movie.new(id).plot
    movie.mpaa_rating = Imdb::Movie.new(id).mpaa_rating
    movie.rating = Imdb::Movie.new(id).rating
    movie.save

    end
  end

  def favorites
    @list = Movie.all
  end

  def favshow
    @movie = Movie.find(params[:id])

  end

  def upvote
    movie = Movie.find(params[:id])
    movie.rating += 0.1
    movie.save
    redirect_to('/movies/favorites')
  end

  def downvote
    movie = Movie.find(params[:id])
    movie.rating -= 0.1
    movie.save
    redirect_to('/movies/favorites')
  end







