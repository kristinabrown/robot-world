class RobotWorldApp < Sinatra::Base
    
  get "/" do
    @population = RobotMaker.population
    erb :dashboard
  end
  
  get "/robots" do
    @robots = RobotMaker.all
    erb :index
  end
  
  get "/robots/new" do
    erb :new
  end
  
  post "/robots" do
    RobotMaker.create(params[:robot])
    redirect '/robots'
  end
  
  get "/robots/:id" do |id|
    @robot = RobotMaker.find(id.to_i)
    erb :show
  end
  
  get "/robots/:id/edit" do |id|
    @robot = RobotMaker.find(id.to_i)
    erb :edit
  end

  put "/robots/:id" do |id|
    RobotMaker.update(id.to_i, params[:robot])
    redirect "/robots/#{id}"
  end
  
  delete "/robots/:id" do |id|
    RobotMaker.destroy(id.to_i)
    redirect "/robots"
  end
end