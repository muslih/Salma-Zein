class Admin::ItemUnitsController < AdminController
  before_action :set_item_unit, only: [:show, :edit, :update, :destroy]

  # GET /item_units
  def index
    @item_units = ItemUnit.all
  end

  # GET /item_units/new
  def new
    @item_unit = ItemUnit.new
  end

  # GET /item_units/1/edit
  def edit
  end

  # POST /item_units
  def create
    @item_unit = ItemUnit.new(item_unit_params)
    if @item_unit.save
      flash[:success] = 'Satuan barang berhasil di tambah'
      redirect_to admin_item_units_path
    else
      flash.now[:danger] = 'Satuan barang gagal di tambah'
      @model = @item_unit
      render :new
    end
  end

  # PATCH/PUT /item_units/1
  def update
    if @item_unit.update(item_unit_params)
      flash[:success] = 'Satuan barang berhasil di update'
      redirect_to admin_item_units_path
    else
      flash.now[:danger] = 'Satuan barang gagal di update'
      @model = @item_unit
      render :edit 
    end
  end

  # DELETE /item_units/1
  def destroy
    @item_unit.destroy 
    flash[:success] = "Satuan barang berhasil di hapus"
    redirect_to admin_item_units_path  
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item_unit
      @item_unit = ItemUnit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_unit_params
      params.require(:item_unit).permit(:name)
    end
end
