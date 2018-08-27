module Arcadia
	module V1
	  class Base < Grape::API
	  	version 'v1', using: :path
	  	mount Users::Base
	  	mount Accounts::Base
	  end
	end
end
