require 'sinatra/base'

module Sinatra
  module Logger
    
    module RequestLogger
      def self.registered(app)
        # Log request method, path and parameters to log file and stdout
        app.before do
          
          # start time of request processing in controller 
          @controller_request_start_time = Time.now
          
          entry = case settings.environment
          when :development, :production
            "[#{Time.now}] #{request.request_method} #{request.path} with: #{params.to_json}"
          else
            nil
          end
          if entry
            puts entry
            logger.info entry
          end
        end
        
        app.after do
          total_time = (Time.now - $request_start_time)*1000
          controller_time = (Time.now - @controller_request_start_time)*1000
          entry = case settings.environment
          when :development, :production
            "Completed #{response.status} in #{'%.2f' % total_time}ms (#{'%.2f' % controller_time}ms in controller)"
          else
            nil
          end
          if entry
            puts entry
            logger.info entry
          end
        end
      end
    end
    
  end
end