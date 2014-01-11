class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.create(category_params)
      if @category.save
        redirect_to '/categories'
      else
        render :new
      end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(param[:id])
    @category.update_attributes!(category_params)
    redirect_to categories_path
  end

  def destroy
    @category.find_by_id(params[:id])
      if @category.destroy
        redirect_to categories_path
      end
  end

  def show
    @category = Category.find(params[:id])
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
