class Admin::FlightTypesController < AdminController
  before_action :set_flight_type, only: [:show, :edit, :update, :destroy]

  # GET /flight_types
  def index
    @flight_types = FlightType.all
  end

  # GET /flight_types/1
  def show
  end

  # GET /flight_types/new
  def new
    @flight_type = FlightType.new
  end

  # GET /flight_types/1/edit
  def edit
  end

  # POST /flight_types
  def create
    @flight_type = FlightType.new(flight_type_params)
    
    if @flight_type.save
      flash[:success] = 'Flight type berhasil di tambah'
      redirect_to admin_flight_types_path
    else
      @model = @flight_type
      flash.now[:danger] = 'Flight type gagal di tambah'
      render :new
    end
  end

  # PATCH/PUT /flight_types/1
  def update
    if @flight_type.update(flight_type_params)
      flash[:success] = 'Flight type berhasil di update'
      redirect_to admin_flight_types_path
    else
      @model = @flight_type
      flash.now[:danger] = 'Flight type gagal di update'
      render :edit 
    end
  end

  # DELETE /flight_types/1
  def destroy
    @flight_type.destroy 
    flash[:success] = 'Flight type berhasil di hapus'
    redirect_to admin_flight_types_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_flight_type
      @flight_type = FlightType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def flight_type_params
      params.require(:flight_type).permit(:name, :flight_class_id)
    end
end
