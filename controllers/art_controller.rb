class ArtController < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  #Setting the root as the parent directory of the current directory
  set :root, File.join(File.dirname(__FILE__),'..')
  # sets the view directory correctly
  set :views, Proc.new{File.join(root,"views")}

  #=== INDEX ===
  get '/art' do
    # defines local var music
    @art = Art.all
    # calls index.erb
    erb :'art/index'
  end
  #=== NEW ===
  get '/art/new' do
    # calls new.erb
    erb :'art/new'
  end
  #=== SHOW ===
  get '/art/:id' do
    # gets id of value
    id = params[:id].to_i
    # defines local var music
    @art = Art.find id
    # calls display.erb
    erb :'art/display'
  end

  #=== EDIT ===
  get '/art/:id/edit' do
    # gets id of value
    id = params[:id].to_i
    # defines local var music
    @art = Art.find id
    # calls edit.erb
    erb :'art/edit'
  end

  #=== CREATE ===
  post '/art' do
  # creates id var
  art = Art.new
  #sets values for new track hash to values from new.erb
  art.pic_name = params[:pic_name]
  art.pic_date = params[:pic_date]
  art.artist_id = params[:artist_id]
  # pushes new hash into global var music
  art.save
  # redirects page to index page
  redirect '/art'
  end
  #=== UPDATE ===
  put '/art/:id' do
    # creates music var
    id = (params[:id].to_i)
    art = Art.find id
    # changes values of track with those from edit.erb
    art.pic_name = params[:pic_name]
    art.pic_date = params[:pic_date]
    art.artist_id = params[:artist_id]
    # saves changes to global var music
    puts art.pic_name
    art.save
    redirect '/art'
  end
  #=== DESTROY ===
  delete '/art/:id' do
    # creates id var
    id = params[:id].to_i
    # deletes item at array index value of id
    Art.destroy id
    redirect '/art'
  end

end

# edits to make:
# change intro page with images with a tag links
