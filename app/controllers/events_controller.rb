class EventsController < ApplicationController

  def new
    @event = Event.new
  end

  def show
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.new(user_id: current_user, title: params[:title], start_date: params[:start_date], duration: params[:duration], description: params[:description], price: params[:price], location: params[:location])
		if @event.save
			flash[:success] = "Event successfully created! 👍"
			#Show events index
			redirect_to '/'
		else
    	# Keeps on the new event view
    	render 'new' 
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
  end

end
