class MyApp < Sinatra::Base

  get "/" do
    erb :index
  end
  
  get "/test" do
    h "Them test route!"
  end
  
end
