class MoviesController < ApplicationController
  def index
    if params[:looking_for].present?
      @movie = JSON.parse((Tmdb::Search.movie(params[:looking_for])).to_json)
      if params[:genre_id].present?
        @genre = params[:genre_id].to_i
      end
    elsif params[:genre_id].present?
      @movie = JSON.parse((Tmdb::Genre.movies(params[:genre_id])).to_json)
    else
      @movie = JSON.parse((Tmdb::Movie.popular).to_json)
    end
    genres = JSON.parse((Tmdb::Genre.movie_list).to_json)
    @genres = genres.map {|genre| [genre['table']['name'], genre['table']['id']]}
  end

  def show
    @movie = JSON.parse((Tmdb::Movie.detail(params[:id])).to_json)
    uri = URI.parse("https://api.themoviedb.org/3/movie/#{params[:id]}/watch/providers?api_key=95405e6efc8fc27ba9e99c3e27422cf5")
    response = Net::HTTP.get_response(uri)
    @providers = JSON.parse(response.body)
    @reviews = Review.where(movie_id: (params[:id]))
  end

  private
  def movie_params
    params.require(:movie).permit(:id)
  end

end
