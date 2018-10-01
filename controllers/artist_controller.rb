class ArtistController < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  #Setting the root as the parent directory of the current directory
  set :root, File.join(File.dirname(__FILE__),'..')
  # sets the view directory correctly
  set :views, Proc.new{File.join(root,"views")}

  #=== INDEX ===
  get '/artists' do
    # defines local var music
    @artist = Artist.all
    # calls index.erb
    erb :'artists/index'
  end
  #=== NEW ===
  get '/artists/new' do
    # calls new.erb
    erb :'artists/new'
  end
  #=== SHOW ===
  get '/artists/:id' do
    # gets id of value
    id = params[:id].to_i
    # defines local var music
    @artist = Artist.find id
    # calls display.erb
    erb :'artists/display'
  end

  #=== EDIT ===
  get '/artists/:id/edit' do
    # gets id of value
    id = params[:id].to_i
    # defines local var music
    @artist = Artist.find id
    # calls edit.erb
    erb :'artists/edit'
  end

  #=== CREATE ===
  post '/artists' do
  # creates id var
  artist = Artist.new
  #sets values for new track hash to values from new.erb
  artist.first_name = params[:first_name]
  artist.last_name = params[:last_name]
  artist.dob = params[:dob]
  # pushes new hash into global var music
  artist.save
  # redirects page to index page
  redirect '/artists'
  end
  #=== UPDATE ===
  put '/artists/:id' do
    # creates music var
    id = (params[:id].to_i)
    artist = Artist.find id
    # changes values of track with those from edit.erb
    artist.first_name = params[:first_name]
    artist.last_name = params[:last_name]
    artist.dob = params[:dob]
    # saves changes to global var music
    puts artist.pic_name
    artist.save
    redirect '/artists'
  end
  #=== DESTROY ===
  delete '/artists/:id' do
    # creates id var
    id = params[:id].to_i
    # deletes item at array index value of id
    Artist.destroy id
    redirect '/artists'
  end

end

# edits to make:
# change intro page with images with a tag links
