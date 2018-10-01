require 'sinatra'
require 'sinatra/reloader' if development?
require 'sinatra/contrib'
require 'pg'
require_relative './model/artist.rb'
require_relative './model/art.rb'
require_relative './controllers/static_controller.rb'
require_relative './controllers/art_controller.rb'
require_relative './controllers/artist_controller.rb'

use Rack::Reloader
use Rack::MethodOverride

run Rack::Cascade.new([
  StaticController,
  ArtController,
  ArtistController
])
