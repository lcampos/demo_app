require 'rubygems'
require 'httparty'

class Partners
  include HTTParty
  #doesn't seem to pick up env variable correctly if I set it here
  #headers 'Authorization' => "OAuth #{ENV['sfdc_token']}"
  format :json
  # debug_output $stderr

  def self.set_headers
    headers 'Authorization' => "OAuth #{ENV['sfdc_token']}"
  end

  def self.root_url
    @root_url = ENV['sfdc_instance_url']+"/services/data/v"+ENV['sfdc_api_version']
  end

  def self.allpartners()
    Partners.set_headers
    soql = "SELECT Id, Name, External_ID__c from Partner__c where Name != \'\'"
    get(Partners.root_url+"/query/?q=#{CGI::escape(soql)}")
  end

  def self.save(params)
    Partners.set_headers
    headers 'Content-Type' => "application/json"
    
    options = {
      :body => {
          :Name => params[:Name],
          :External_ID__c => params[:External_ID__c]
      }.to_json
    }
    p options
    response = post(Partners.root_url+"/sobjects/Partner__c/#{params[:id]}?_HttpMethod=PATCH", options)
    # 201 response.body equals success
    # puts response.body, response.code, response.message
  end

  def self.retrieve(id)
    Partners.set_headers
    get(Partners.root_url+"/sobjects/Partner__c/#{id}?fields=Id,Name,External_ID__c") 
  end

  def self.create_partner(params)
    Partners.set_headers
    headers 'Content-Type' => "application/json"
    
    options = {
      :body => {
          :Name => params[:Name],
          :External_ID__c => params[:External_ID__c]
      }.to_json
    }
    response = post(Partners.root_url+"/sobjects/Partner__c/", options)
    # 201 response.body equals success
    # puts response.body, response.code, response.message
  end





end
