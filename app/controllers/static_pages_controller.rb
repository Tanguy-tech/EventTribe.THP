class StaticPagesController < ApplicationController

  before_action :authenticate_user!, only: [:secret]

  def index
    @event = Event.all
  end

  def secret
  end
  
  def contact
  end

end
