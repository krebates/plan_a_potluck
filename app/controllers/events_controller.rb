class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.create(event_params)
      if @event.save
        redirect_to '/events'
      else
        render :new
      end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(param[:id])
    @event.update_attributes!(event_params)
    redirect_to events_path
  end

  def destroy
    @event.find_by_id(params[:id])
      if @event.destroy
        redirect_to events_path
      end
  end

  def show
    @event = Event.find(params[:id])
  end

  private

  def event_params
    params.require(:event).permit(:event_name, :street_address, :city, :state, :zip_code, :phone_number, :user_id)
  end
end
