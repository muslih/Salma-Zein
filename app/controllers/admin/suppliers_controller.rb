class Admin::SuppliersController < AdminController
  before_action :set_supplier, only: [:show, :edit, :update, :destroy]

  # GET /suppliers
  def index
    @suppliers = Supplier.all
  end

  # GET /suppliers/new
  def new
    @supplier = Supplier.new
  end

  # GET /suppliers/1/edit
  def edit
  end

  # POST /suppliers
  def create
    @supplier = Supplier.new(supplier_params)
    if @supplier.save
      flash[:success] = 'Supplier berhasil di tambah'
      redirect_to admin_suppliers_path
    else
      flash.now[:danger] = 'Supplier gagal di tambah'
      @model = @supplier
      render :new
    end
  end

  # PATCH/PUT /suppliers/1
  def update
    if @supplier.update(supplier_params)
      flash[:success] = 'Supplier berhasil di update'
      redirect_to admin_suppliers_path
    else
      @model = @supplier
      flash.now[:danger] = 'Supplier gagal di update'
      render :edit 
    end
  end

  # DELETE /suppliers/1
  def destroy
    @supplier.destroy 
    flash[:success] = "Supplier berhasil di hapus"
    redirect_to admin_suppliers_path 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_supplier
      @supplier = Supplier.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def supplier_params
      params.require(:supplier).permit(:name, :address, :contact_person, :phone, :business_field, :management_system)
    end
end
