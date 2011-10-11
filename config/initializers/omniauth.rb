require 'forcedotcom'

# Set the default hostname for omniauth to send callbacks to.
# seems to be a bug in omniauth that it drops the httpS
# this still exists in 0.2.0
#OmniAuth.config.full_host = 'https://localhost:3000'


#OmniAuth.config.full_host = 'https://telesales-rails.heroku.com'

module OmniAuth
  module Strategies
    #tell omniauth to load our strategy
    autoload :Forcedotcom, 'lib/forcedotcom'
  end
end

# created a new remote access for heroku
Rails.application.config.middleware.use OmniAuth::Builder do
	#provider :forcedotcom, client_key, client_secret
  	#provider :forcedotcom, '3MVG9Oe7T3Ol0ea5IyD_vRQiffzilFchfSDuwzR9S.O7.XUr49a5s9C_tlTUqfBi4St9aVP8F2SC9xESbczRn','8303684421513603327', {:site => "https://test.salesforce.com", :authorize_path => "/services/oauth2/token", :username => 'sap@msights.com.conf091211', :password => 'mSights#9' }
  	
	# ALWAYS RESTART YOUR SERVER IF YOU MAKE CHANGES TO THESE SETTINGS!

	# you need a store for OpenID; (if you deploy on heroku you need Filesystem.new('./tmp') instead of Filesystem.new('/tmp'))
	require 'openid/store/filesystem'

	#Overloading the adapter, because Omniauth sets to the login and not the prelogin
	provider :forcedotcom, ENV['sfdc_consumer_key'], ENV['sfdc_consumer_secret']


	OmniAuth.config.full_host = ENV['full_host']

end