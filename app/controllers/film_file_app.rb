require 'json'

class FilmFile < Sinatra::Base
  get '/films' do
    @films =  Film.all
    erb :films_index
  end

  get '/genres' do
    @genres = Genre.all
    erb :genres_index
  end

  post '/genres' do
    status, body = GenreParser.new(params[:genre])
    data = JSON.parse(params[:genre])
    genre = Genre.new(data)

    if genre.save
      "Genre created."
    else
      status 400
      body genre.errors.full_messages.join(", ")
    end
  end

  get '/directors/:id' do

  end
end
