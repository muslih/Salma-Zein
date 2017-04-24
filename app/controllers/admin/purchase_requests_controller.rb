class Admin::PurchaseRequestsController < AdminController
  before_action :set_pr
  before_action :set_purchase_request

  # GET /purchase_requests
  def index
    @purchase_requests = PurchaseRequest.all
    if current_user_administrasi || current_user_logistik
    @purchase_requests = PurchaseRequest.where(status:true).all
  end
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
    @purchase_request.employee_id = current_user.employee.id
    @purchase_request.date_created = DateTime.now
    # @purchase_request.total = @purchase_request.total_all
    @purchase_request.pr_number = @purchase_request.generate_pr_number
    @purchase_request.status = ''
    if @purchase_request.save
      flash[:success] = 'Purchase Request berhasil di tambah'
      redirect_to admin_purchase_requests_path
    else
      flash.now[:danger] = 'Barang gagal di tambah'
      @model = @purchase_request
      render :new
    end
  end

  # PATCH/PUT /purchase_requests/1
  def update
    @purchase_request.updated_user_id = current_user.id
    if @purchase_request.update(purchase_request_params)
      flash[:success] = 'Purchase Request berhasil di update'
      redirect_to admin_purchase_request_path(@purchase_request)
    else
      @model = @purchase_request
      flash.now[:danger] = 'Purchase Request di update'
      render :edit 
    end
  end

  def reject_pr; end

  def reject_pr_update
    respond_to do |format|
      if @purchase_request.update(reject_pr_params) && @purchase_request.update(status: false)
        format.js { @status = true }
        @message = "Purchase Request ditolak"
        # flash[:success] = 'Purchase request di tolak'
        # redirect_to admin_purchase_request_path(@pr.id)  
      else
        format.js { @status = false }
        # flash[:danger] = 'Purchase request gagal di tolak'
      # redirect_to admin_purchase_request_path(purchase_request) 
      end
    end
  end

  # DELETE /purchase_requests/1
  def destroy
    @purchase_request.destroy 
    flash[:success] = 'Purchase request berhasil di hapus'
    redirect_to admin_purchase_requests_path  
  end

  def accept_pr
    if @pr.update_attribute(:status, true)
      flash[:success] = 'Purchase request berhasil di direkomendasikan'
      redirect_to admin_purchase_request_path(@pr.id)  
    else
      flash[:danger] = 'Purchase request gagal di direkomendasikan'
      redirect_to admin_purchase_request_path(purchase_request) 
    end
  end

  private
    def set_pr
      @pr = PurchaseRequest.find(params[:id]) if params[:id]
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_purchase_request
      @purchase_request = PurchaseRequest.find(params[:id]) if params[:id]
    end

    def reject_pr_params
      params.require(:purchase_request).permit(:status_desc)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def purchase_request_params
      params.require(:purchase_request).permit(:purchase_request_id, :employee_id, :pr_number, :date_created, :date_required, :request_reason, :status, :status_desc, :total, :updated_user_id ,
        purchase_request_details_attributes: [:id, :item_id, :qty, :sub_total, :_destroy])
    end
end