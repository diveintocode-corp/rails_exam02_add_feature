class MoviesController < ApplicationController

  def index
    @movies = Movies::IndexService.new.movies
  end

  def show; end

  def new
    @movie = Movie.new
  end

  def edit; end

  def create
    repository = Movies::CreateOrUpdateService.new(params)
    @movie = repository.movie
    repository.run ?
      redirect_to repository.movie, notice: 'Movie was successfully created.' :
      render :new
  end

  def update
    repository = Movies::CreateOrUpdateService.new(params)
    @movie = repository.movie
    repository.run ?
      redirect_to repository.movie, notice: 'Movie was successfully updated.' :
      render :edit
  end

  def destroy
    repository = Movies::DestroyService.new(params)
    @movie = repository.movie
    repository.run ?
      redirect_to movies_url, notice: 'Movie was successfully destroyed.'
      render :show
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :summary)
  end
end
