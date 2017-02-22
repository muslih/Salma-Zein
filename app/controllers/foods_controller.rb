class FoodsController < ApplicationController
  before_action :set_food, only: [:show, :edit, :update, :destroy]

  # GET /foods
  def index
    @foods = Food.all
  end

  # GET /foods/1
  def show
  end

  # GET /foods/new
  def new
    @food = Food.new
  end

  # GET /foods/1/edit
  def edit
  end

  # POST /foods
  def create
    @food = Food.new(food_params)
    
    if @food.save
      flash[:success] = 'Makanan berhasil di tambah'
      redirect_to foods_path
    else
      @model = @food
      flash.now[:danger] = 'Makanan gagal di tambah'
      render :new
    end
  end

  # PATCH/PUT /foods/1
  def update
    if @food.update(food_params)
      flash[:success] = 'Makanan berhasil di update'
      redirect_to foods_path
    else
      @model = @food
      flash.now[:danger] = 'Makanan gagal di update'
      render :edit 
    end
  end

  # DELETE /foods/1
  def destroy
    @food.destroy 
    flash[:success] = 'Makanan berhasil di hapus'
    redirect_to foods_path  
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_food
      @food = Food.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def food_params
      params.require(:food).permit(:name, food_recipes_attributes: [:id, :item_id, :qty, :_destroy])
    end
end
