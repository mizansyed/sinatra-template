require "sinatra/base"

require "dm-core"
require "dm-validations"
require "dm-migrations"
require "dm-serializer"
require "dm-sqlite-adapter"
require "sinatra/logger"
require "json"

require "./lib/init"

Dir.glob("./app/controllers/*.rb") {|f| require f}
Dir.glob("./app/models/*.rb") {|f| require f}

class MyApp < Sinatra::Base
  register Sinatra::Logger
  register Sinatra::Logger::RequestLogger
  
  helpers Helpers::Common
  
  enable    :method_override
  enable    :sessions
  set       :session_secret,    "super secret"
  set       :views,             Proc.new { File.join(root, "app/views") }

  configure do
    set :app_file, __FILE__
    
    DataMapper.setup(:default, "sqlite3://#{settings.root}/#{settings.environment}.db")
    DataMapper.finalize
    DataMapper.auto_upgrade!
  end

  configure :development do    
    enable :logging, :dump_errors, :raise_errors
    set :logger_level, :debug
  end

  configure :qa do
    enable :logging, :dump_errors, :raise_errors
  end

  configure :production do
    set :raise_errors,      false   #false will show nicer error page
    set :show_exceptions,   false   #true will ignore raise_errors and display backtrace in browser   
    set :logger_level, :info
     
  end
end
