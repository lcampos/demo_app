require 'accounts'
require 'partners'

class SessionsController < ApplicationController
  def create
    ENV['sfdc_token'] = request.env['omniauth.auth']['credentials']['token']
    ENV['sfdc_instance_url'] = request.env['omniauth.auth']['instance_url']
    #auth = request.env["omniauth.auth"]
    #user = User.create_with_omniauth(auth)
    #session[:user_id] = user.id
    # render :text => request.env['omniauth.auth'].inspect
    # render :text => Accounts.get_first_hundred.inspect
    redirect_to :controller => 'partners', :action => 'index', :notice => "Signed in"
  end
  def fail
    render :text =>  request.env["omniauth.auth"].to_yaml
  end

  def destroy
    #session[:user_id] = nil
    redirect_to root_url, :notice => "signed out! "
  end

end