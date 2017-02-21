class Admin::ReligionsController < AdminController
  before_action :set_religion, only: [:show, :edit, :update, :destroy]

  # GET /religions
  def index
    @religions = Religion.all
  end

  # GET /religions/new
  def new
    @religion = Religion.new
  end

  # GET /religions/1/edit
  def edit
  end

  # POST /religions
  def create
    @religion = Religion.new(religion_params)
    if @religion.save
      flash[:success] = 'Agama berhasil di tambah'
      redirect_to admin_religions_path
    else
      flash.now[:danger] = 'Agama gagal di tambah'
      @model = @religion
      render :new
    end
  end

  # PATCH/PUT /religions/1
  def update
    if @religion.update(religion_params)
      flash[:success] = 'Agama berhasil di update'
      redirect_to admin_religions_path
    else
      @model = @religion
      flash.now[:danger] = 'Agama gagal di update'
      @model = @religion
      render :edit 
    end
  end

  # DELETE /religions/1
  def destroy
    @religion.destroy 
    flash[:success] = 'Agama berhasil di hapus'
    redirect_to admin_religions_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_religion
      @religion = Religion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def religion_params
      params.require(:religion).permit(:name)
    end
end
