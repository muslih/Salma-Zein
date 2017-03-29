class Admin::FlightClassesController < AdminController
  before_action :set_flight_class, only: [:show, :edit, :update, :destroy]

  # GET /flight_classes
  # GET /flight_classes.json
  def index
    @flight_classes = FlightClass.all
  end

  # GET /flight_classes/1
  # GET /flight_classes/1.json
  def show
  end

  # GET /flight_classes/new
  def new
    @flight_class = FlightClass.new
  end

  # GET /flight_classes/1/edit
  def edit
  end

  # POST /flight_classes
  # POST /flight_classes.json
  def create
    @flight_class = FlightClass.new(flight_class_params)
    
    if @flight_class.save
      flash[:success] = 'Flight class berhasil di tambah'
      redirect_to admin_flight_classes_path
    else
      @model = @flight_class
      flash.now[:danger] = 'Flight class gagal di tambah'
      render :new
    end
  end

  # PATCH/PUT /flight_classes/1
  # PATCH/PUT /flight_classes/1.json
  def update
    if @flight_class.update(flight_class_params)
      flash[:success] = 'Flight class berhasil di update'
      redirect_to admin_flight_classes_path
    else
      @model = @flight_class
      flash.now[:danger] = 'Flight class gagal di update'
      render :edit 
    end
  end

  # DELETE /flight_classes/1
  # DELETE /flight_classes/1.json
  def destroy
    @flight_class.destroy 
    flash[:success] = 'Flight class berhasil di hapus'
    redirect_to admin_flight_classes_path  
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_flight_class
      @flight_class = FlightClass.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def flight_class_params
      params.require(:flight_class).permit(:name, :desc)
    end
end
