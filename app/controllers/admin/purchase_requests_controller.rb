class Admin::PurchaseRequestsController < AdminController
  before_action :set_purchase_request, only: [:show, :edit, :update, :destroy]

  # GET /purchase_requests
  def index
    @purchase_requests = PurchaseRequest.all
  end

  # GET /purchase_requests/1
  def show
  end

  # GET /purchase_requests/new
  def new
    @purchase_request = PurchaseRequest.new
  end

  # GET /purchase_requests/1/edit
  def edit
  end

  # POST /purchase_requests
  def create
    @purchase_request = PurchaseRequest.new(purchase_request_params)
    @purchase_request.total = @purchase_request.total_all
    if @purchase_request.save
      flash[:success] = 'Purchase Request di tambah'
      redirect_to admin_purchase_requests_path
    else
      flash.now[:danger] = 'Barang gagal di tambah'
      @model = @purchase_request
      render :new
    end
  end

  # PATCH/PUT /purchase_requests/1
  def update
    @purchase_request.total = @purchase_request.total_all
    if @purchase_request.update(purchase_request_params)
      flash[:success] = 'Purchase Request di update'
      redirect_to admin_purchase_requests_path
    else
      @model = @purchase_request
      flash.now[:danger] = 'Purchase Request di update'
      render :edit 
    end
  end

  # DELETE /purchase_requests/1
  def destroy
    @purchase_request.destroy 
    flash[:success] = 'Purchase request berhasil di hapus'
    redirect_to admin_purchase_requests_path  
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purchase_request
      @purchase_request = PurchaseRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def purchase_request_params
      params.require(:purchase_request).permit(:purchase_request_id, :employee_id, :pr_number, :date_created, :date_required, :request_reason, :status, :status_desc,
        purchase_request_details_attributes: [:id, :item_id, :qty, :total, :_destroy])
    end
end
