require 'sinatra/base'

module Sinatra
  module Logger
    
    # Basic request logger. Logs request method, path, parameters and request processing time to log/environment.log
    module RequestLogger
      def self.registered(app)
        
        app.before do
          @request_start_time = Time.now
                    
          case settings.environment
          when :development, :production
            entry = "[#{Time.now}] #{request.request_method} #{request.path} with: #{params.to_json}"
            puts entry
            logger.info entry
          end
        end
        
        app.after do
          request_time = (Time.now - @request_start_time)*1000
          entry = case settings.environment
          when :development, :production
           entry =  "Completed #{response.status} in #{'%.2f' % request_time}ms"
           puts entry
           logger.info entry
          end
        end
      end
    end
    
  end
end