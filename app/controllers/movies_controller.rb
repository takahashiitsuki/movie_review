class MoviesController < ApplicationController
  
  require 'themoviedb-api'
  Tmdb::Api.key("95405e6efc8fc27ba9e99c3e27422cf5")
  Tmdb::Api.language("ja") # こちらで映画情報の表示の際の言語設定を日本語にできます
  
  def search
  end
  
  def show
  end
end
