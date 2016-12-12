class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  def index
    @categories=Category.search_categories(params[:search]).paginate(per_page: 5, page: params[:page])
    @category=Category.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @questions=@category.search_questions(params[:search]).paginate(per_page: 5, page: params[:page])
    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
  end

  def create
    @categories=Category.paginate(per_page: 5, page: params[:page])
    @category=Category.new(category_params)
    if @category.save
      flash[:success] = "Create category success!"
      redirect_to categories_url
    else
      render :index
    end
  end

  def edit
  end

  def update
    if @category.update_attributes(category_params)
      flash[:success] = "Update category success"
      redirect_to @category
    else
      flash[:danger] = "Update category fail"
      redirect_to @category
    end
  end

  def  destroy
    if @category.destroy
      flash[:success] = "Destroy category success"
      respond_to do |format|
        format.html { redirect_to categories_url}
      end

    else
      flash[:danger] = "Destroy category fail"
      respond_to do |format|
        format.html { redirect_to categories_url}
      end
    end
  end

  private

  def set_category
      @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:id,:name)
  end
end
