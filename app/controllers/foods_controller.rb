class FoodsController < ApplicationController

  def index
    @event = Event.find(params[:event_id])
    @foods = @event.foods
    @category = Category.find(params[:category_id])
  end

  def new
    @food = Food.new
    @event = Event.find(params[:event_id])
    @category = Category.find(params[:category_id])
  end

  def create
    @food = Food.create(food_params)
    @event = Event.find(params[:event_id])
    @category = Category.find(params[:category_id])
    @food.event_id = @event.id
    @food.category_id = @category.id
    # @food.user_id = current_user.id

    if @food.save
      redirect_to event_category_foods_path(@event, @category)
    else
      render :new
    end
  end

  def edit
    @food = Food.find(params[:id])
  end

  def update
    @food = Food.find(param[:id])
    @food.update_attributes!(event_params)
    redirect_to event_category_foods_path
  end

  def destroy
    @food.find_by_id(params[:id])
      if @food.destroy
        redirect_to event_category_foods_path
      end
  end

  def show
    @food = Food.find(params[:id])
  end

  private

  def food_params
    params.require(:food).permit(:name, :comments, :event_id, :user_id, :category_id)
  end
end
