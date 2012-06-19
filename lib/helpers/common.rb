require 'sinatra/base'

module Helpers
  module Common
    
    # HTML escape 
    # @param html content that will be escaped
    def h(text)
      Rack::Utils.escape_html(text)
    end
  end
end