class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # GET /items
  def index
    @items = Item.all
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:success] = 'Barang berhasil di tambah'
      redirect_to items_path
    else
      flash.now[:danger] = 'Barang gagal di tambah'
      @model = @item
      render :new
    end
  end

  # PATCH/PUT /items/1
  def update
    if @item.update(item_params)
      flash[:success] = 'Barang berhasil di hapus'
      redirect_to items_path
    else
      flash.now[:danger] = 'Barang gagal di update'
      @model = @item
      render :edit 
    end
  end

  # DELETE /items/1
  def destroy
    @item.destroy
    flash[:success] = "Barang berhasil di hapus"
    redirect_to items_path  
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:supplier_id, :item_category_id, :item_unit_id, :code, :lot_number, :name, :spec, :price, :desc, :halal_certificate, :warranty)
    end
end
