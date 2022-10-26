class MoviesController < ApplicationController
  
  def search
    
  end
  
  def index
    
  end
  
  def show
    @movie = JSON.parse((Tmdb::Movie.detail(params[:id])).to_json)
    uri = URI.parse("https://api.themoviedb.org/3/movie/#{params[:id]}/watch/providers?api_key=95405e6efc8fc27ba9e99c3e27422cf5")
    response = Net::HTTP.get_response(uri)
    # @providers = JSON.parse(response.body)
  end
  
  private
  def movie_params
    params.require(:movie).permit(:id)
  end
  
end
