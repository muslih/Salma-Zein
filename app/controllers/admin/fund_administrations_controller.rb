class Admin::FundAdministrationsController < AdminController
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

    if @fund_administration.save
      flash[:success] = 'Pencatatan dana PO erhasil di tambah'
      redirect_to admin_fund_administrations_path
    else
      @model = @fund_administration
      flash.now[:danger] = 'Pencatatan dana PO agal di tambah'
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
    # Use callbacks to share common setup or constraints between actions.
    def set_fund_administration
      @fund_administration = FundAdministration.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fund_administration_params
      params.require(:fund_administration).permit(:purchase_order_id, :ammount, :date_out)
    end
end
