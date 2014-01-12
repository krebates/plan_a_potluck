class CategoriesController < ApplicationController

  def new
    @category = Category.new
    @event = Event.find(params[:event_id])
  end

  def create
    @category = Category.create(category_params)
    @event = Event.find(params[:event_id])
    @category.event = @event

    if @category.save
      redirect_to new_event_category_food_path(@event, @category)
    else
      render :new
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(param[:id])
    @event = Event.find(params[:event_id])
    @category.update_attributes!(category_params)
    redirect_to event_categories_path(@event)
  end

  def destroy
    @category.find_by_id(params[:id])
    @event = Event.find(params[:event_id])

    if @category.destroy
      redirect_to event_categories_path(@event)
    end
  end

  def show
    @category = Category.find(params[:id])
    @event = Event.find(params[:event_id])
    @current_foods = @category.foods
  end

  private

  def category_params
    params.require(:category).permit(:name, :event_id)
  end
end
