require 'partners'

class PartnersController < ApplicationController
  def index
    @json = Partners.allpartners()
  end
  
  def create
     @partner = Partners.create_partner(params)
  end
  
  def edit
     @partner = Partners.retrieve(params[:id])
  end
  
  def save
    Partners.save(params)
    redirect_to :action => :show, :id => params[:id]
  end  

  def show
    @partner = Partners.retrieve(params[:id])  
  end

  def save_partner
    Partners.create_partner(params)
    redirect_to :action => :index
  end

end