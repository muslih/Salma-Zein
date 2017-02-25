class Admin::PurchaseOrdersController < AdminController
  before_action :set_purchase_order, only: [:show, :edit, :update, :destroy]

  # GET /purchase_orders
  def index
    @purchase_orders = PurchaseOrder.all
  end

  # GET /purchase_orders/1
  def show
  end

  # GET /purchase_orders/new
  def new
    @purchase_order = PurchaseOrder.new
  end

  # GET /purchase_orders/1/edit
  def edit
  end

  # POST /purchase_orders
  def create
    @purchase_order = PurchaseOrder.new(purchase_order_params)

    if @purchase_order.save
      flash[:success] = 'Purchase Order berhasil di tambah'
      redirect_to admin_purchase_orders_path
    else
      flash.now[:danger] = 'Purchase Order gagal di tambah'
      @model = @purchase_order
      render :new
    end
  end

  # PATCH/PUT /purchase_orders/1
  def update
    if @purchase_order.update(purchase_order_params)
      flash[:success] = 'Purchase Order berhasil di update'
      redirect_to admin_purchase_orders_path
    else
      @model = @purchase_order
      flash.now[:danger] = 'Purchase Order gagal di update'
      render :edit 
    end
  end

  # DELETE /purchase_orders/1
  def destroy
    @purchase_order.destroy 
    flash[:success] = 'Purchase Order berhasil di hapus'
    redirect_to admin_purchase_orders_path 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purchase_order
      @purchase_order = PurchaseOrder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def purchase_order_params
      params.require(:purchase_order).permit(:purchase_order_id, :purchase_order_address_id, :po_number, :arrival_estimated, :status)
    end
end
