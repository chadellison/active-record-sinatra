require './test/test_helper'
require 'json'

class CreateGenreTest < Minitest::Test
  include Rack::Test::Methods     # allows us to use get, post, last_request, etc.

  def app     # def app is something that Rack::Test is looking for
    FilmFile
  end

  def setup
    DatabaseCleaner.start
    super
  end

  def teardown
    DatabaseCleaner.clean
    super
  end

  def test_create_a_genre_with_valid_attributes
    post '/genres', { genre: { name: "Cartoon" }.to_json }
    assert_equal 1, Genre.count
    assert_equal 200, last_response.status
    assert_equal "Genre created.", last_response.body
  end

  def test_genre_is_not_created_when_missing_name
    post '/genres', { "genre"=>"{}" }
    assert_equal 0, Genre.count
    assert_equal 400, last_response.status
    assert_equal "Name can't be blank, Name can't be blank", last_response.body
  end
end
