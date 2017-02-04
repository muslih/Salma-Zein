class ItemCategoriesController < ApplicationController
  before_action :set_item_category, only: [:show, :edit, :update, :destroy]

  # GET /item_categories
  def index
    @item_categories = ItemCategory.all
  end

  # GET /item_categories/new
  def new
    @item_category = ItemCategory.new
  end

  # GET /item_categories/1/edit
  def edit
  end

  # POST /item_categories
  def create
    @item_category = ItemCategory.new(item_category_params)
    if @item_category.save
      redirect_to item_categories_path
    else
      render :new
    end
  end

  # PATCH/PUT /item_categories/1
  def update
    if @item_category.update(item_category_params)
      redirect_to item_categories_path
    else
      @model = @item_category
      render :edit 
    end
  end

  # DELETE /item_categories/1
  def destroy
    @item_category.destroy 
    redirect_to item_categories_path  
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item_category
      @item_category = ItemCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_category_params
      params.require(:item_category).permit(:name)
    end
end
