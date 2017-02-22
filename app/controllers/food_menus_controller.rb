class FoodMenusController < ApplicationController
  before_action :set_food_menu, only: [:show, :edit, :update, :destroy]

  # GET /food_menus
  def index
    @food_menus = FoodMenu.all
  end

  # GET /food_menus/1
  def show
  end

  # GET /food_menus/new
  def new
    @food_menu = FoodMenu.new
  end

  # GET /food_menus/1/edit
  def edit
  end

  # POST /food_menus
  def create
    @food_menu = FoodMenu.new(food_menu_params)

    if @food_menu.save
      flash[:success] = 'Menu Makanan berhasil di tambah'
      redirect_to food_menus_path
    else
      @model = @food_menu
      flash.now[:danger] = 'Menu Makanan gagal di tambah'
      render :new
    end
  end

  # PATCH/PUT /food_menus/1
  def update
    if @food_menu.update(food_menu_params)
      flash[:success] = 'Makanan berhasil di update'
      redirect_to food_menus_path
    else
      @model = @food_menu
      flash.now[:danger] = 'Makanan gagal di update'
      render :edit 
    end
  end

  # DELETE /food_menus/1
  def destroy
    @food_menu.destroy 
    flash[:success] = 'Menu Makanan berhasil di hapus'
    redirect_to food_menus_path  
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_food_menu
      @food_menu = FoodMenu.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def food_menu_params
      params.require(:food_menu).permit(:cycle_id, :flight_class_id, :name, :start_date_peroid, :date_peroid_end,
                      food_menu_details_attributes: [:id ,:food_id, :food_qty, :weight, :status, :_destroy])
    end
end
