class MoviesController < ApplicationController
  before_action :set_movie, only: %i[show edit]

  def index
    @movies = Movies::IndexService.new.movies
  end

  def show; end

  def new
    @movie = Movie.new
  end

  def edit; end

  def create
    repository = Movies::CreateOrUpdateService.new(movie_params)
    result = repository.run
    @movie = repository.movie
    if result
      redirect_to @movie, notice: 'Movie was successfully created.'
    else
      render :new
    end
  end

  def update
    repository = Movies::CreateOrUpdateService.new(movie_params)
    result = repository.run
    @movie = repository.movie
    if repository.run
      redirect_to repository.movie, notice: 'Movie was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    repository = Movies::DestroyService.new(movie_params)
    result = repository.run
    @movie = repository.movie
    if repository.run
      redirect_to movies_url, notice: 'Movie was successfully destroyed.'
    else
      render :show
    end
  end

  private

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:title, :summary)
  end
end
