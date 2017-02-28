class Admin::PurchaseOrderAddressesController < AdminController
  before_action :set_purchase_order_address, only: [:show, :edit, :update, :destroy]

  # GET /purchase_order_addresses
  def index
    @purchase_order_addresses = PurchaseOrderAddress.all
  end

  # GET /purchase_order_addresses/1
  def show
  end

  # GET /purchase_order_addresses/new
  def new
    @purchase_order_address = PurchaseOrderAddress.new
  end

  # GET /purchase_order_addresses/1/edit
  def edit
  end

  # POST /purchase_order_addresses
  def create
    @purchase_order_address = PurchaseOrderAddress.new(purchase_order_address_params)

    if @purchase_order_address.save
      flash[:success] = 'Alamat PO berhasil di tambah'
      redirect_to admin_purchase_order_addresses_path
    else
      @model = @purchase_order_address
      flash.now[:danger] = 'Alamat PO gagal di tambah'
      render :new
    end
  end

  # PATCH/PUT /purchase_order_addresses/1
  def update
    if @purchase_order_address.update(purchase_order_address_params)
      flash[:success] = 'Alamat PO berhasil di update'
      redirect_to admin_purchase_order_addresses_path
    else
      @model = @purchase_order_address
      flash.now[:danger] = 'Alamat PO gagal di update'
      render :edit 
    end
  end

  # DELETE /purchase_order_addresses/1
  def destroy
    @purchase_order_address.destroy 
    flash[:success] = 'Alamat PO berhasil di hapus'
    redirect_to admin_purchase_order_addresses_path 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purchase_order_address
      @purchase_order_address = PurchaseOrderAddress.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def purchase_order_address_params
      params.require(:purchase_order_address).permit(:name, :address, :pic, :phone)
    end
end
