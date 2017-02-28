class Admin::FundAdministrationsController < AdminController
  before_action :set_po, on: [:new, :create]
  before_action :set_fund_administration, only: [:show, :edit, :update, :destroy]

  # GET /fund_administrations
  def index
    @fund_administrations = FundAdministration.all
  end

  # GET /fund_administrations/1
  def show
  end

  # GET /fund_administrations/new
  def new
    @fund_administration = FundAdministration.new
  end

  # GET /fund_administrations/1/edit
  def edit
  end

  # POST /fund_administrations
  def create
    @fund_administration = FundAdministration.new(fund_administration_params)
    @fund_administration.date_out = DateTime.now
      @fund_administration.purchase_order_id = @po.id
      @fund_administration.ammount = @po.purchase_request.total
    if @fund_administration.save
      if current_user_administrasi
        PurchaseOrder.find(@po.id).update_attributes(status: "sudah dibayar")
      end
      flash[:success] = 'Pencatatan dana PO berhasil di tambah'
      redirect_to admin_fund_administrations_path
    else
      @model = @fund_administration
      flash.now[:danger] = 'Pencatatan dana PO gaagal di tambah'
      render :new
    end
  end

  # PATCH/PUT /fund_administrations/1
  def update
    if @fund_administration.update(fund_administration_params)
      flash[:success] = 'Pencatatan dana PO berhasil di update'
      redirect_to admin_fund_administrations_path
    else
      @model = @fund_administration
      flash.now[:danger] = 'Pencatatan dana PO gagal di update'
      render :edit 
    end
  end

  # DELETE /fund_administrations/1
  def destroy
    @fund_administration.destroy 
    flash[:success] = 'Pencatatan dana PO berhasil di hapus'
    redirect_to admin_fund_administrations_path 
  end

  private
    def set_po
      @po = PurchaseOrder.find(params[:purchase_order_id]) if params[:purchase_order_id]
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_fund_administration
      if params[:fund_administration_id]
        @fund_administration = FundAdministration.find(params[:fund_administration_id])
      else
        @fund_administration = FundAdministration.find(params[:id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fund_administration_params
      params.require(:fund_administration).permit(:purchase_order_id, :ammount, :date_out)
    end
end
