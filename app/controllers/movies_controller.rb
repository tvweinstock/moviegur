class MoviesController < ApplicationController

  # before_filter :load_movie, only: [:show, :edit, :update, :destroy] 
  before_filter :load_movie, :except => [:index, :new, :create] 
  before_filter :ensure_logged_in 

  # skip_before_filter :check_country, :except =>index 
 # before_action  same as before_filter

  def index
    @movies = Movie.all    
  end

  def show    
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to movies_path # browser is going to make a new get request for '/movies'; issue the action
    else
      render :new # render will not issue a request to the server again, will look in views folder for associated template
    end  
  end

  def edit
  end

  def update
    if @movie.update(movie_params)
      redirect_to movies_path
    else
      render :edit
    end
  end

  def destroy
    @movie.destroy
    redirect_to movies_path
  end

  private
  def movie_params
    params.require(:movie).permit(:title, :director, :actor)
  end

  def load_movie
    @movie = Movie.find(params[:id])
  end

end
