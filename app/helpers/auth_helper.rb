module AuthHelper
	class AuthToken
  		def self.encode(payload, exp=2.minutes.from_now)
  			payload[:exp] = exp.to_i
  			#JWT.encode(payload, Rails.application.secrets.secret_key_base)
        JWT.encode(payload, 'IAlsoNeedToChangeThis')
  		end

  		def self.decode(token)
    	  #payload = JWT.decode(token, Rails.application.secrets.secret_key_base)[0]
        payload = JWT.decode(token, 'IAlsoNeedToChangeThis')[0]
    	  DecodedAuthToken.new(payload)
        rescue JWT::ExpiredSignature
          fail AuthenticationTimeoutError
  			rescue
  				# It will raise an error if it is not a token that was
  				#generated with our secret key or if the user changes the
  				# contents of the payload
    		  nil
  			end
		end

		# We could just return the payload as a hash, but having keys with
		# indifferent access is always nice, plus we get an expired? method
		# that will be useful later
	class DecodedAuthToken < HashWithIndifferentAccess
		def expired?
			self[:exp] <= Time.now.to_i
		end
	end

  class NotAuthenticatedError < StandardError
  end
  
  class AuthenticationTimeoutError < StandardError
  end
end