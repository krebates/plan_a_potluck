class FoodsController < ApplicationController

  def index
    @foods = Food.all
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.create(food_params)
      if @food.save
        redirect_to '/foods'
      else
        render :new
      end
  end

  def edit
    @food = Food.find(params[:id])
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
