class MoviesController < ApplicationController
  
  def search
    
  end
  
  def index
    
  end
  
  def show
    @movie = JSON.parse((Tmdb::Movie.detail(params[:id])).to_json)
    
  end
  
  private
  def movie_params
    params.require(:movie).permit(:id)
  end
  
end
