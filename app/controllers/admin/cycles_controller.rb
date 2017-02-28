class Admin::CyclesController < AdminController
  before_action :set_cycle, only: [:show, :edit, :update, :destroy]

  # GET /cycles
  # GET /cycles.json
  def index
    @cycles = Cycle.all
  end

  # GET /cycles/1
  # GET /cycles/1.json
  def show
  end

  # GET /cycles/new
  def new
    @cycle = Cycle.new
  end

  # GET /cycles/1/edit
  def edit
  end

  # POST /cycles
  # POST /cycles.json
  def create
    @cycle = Cycle.new(cycle_params)

    if @cycle.save
      flash[:success] = 'cycle berhasil di tambah'
      redirect_to admin_cycles_path
    else
      @model = @cycle
      flash.now[:danger] = 'cycle gagal di tambah'
      render :new
    end
  end

  # PATCH/PUT /cycles/1
  # PATCH/PUT /cycles/1.json
  def update
    if @cycle.update(cycle_params)
      flash[:success] = 'cycle berhasil di update'
      redirect_to admin_cycles_path
    else
      @model = @cycle
      flash.now[:danger] = 'cycle gagal di update'
      render :edit 
    end
  end

  # DELETE /cycles/1
  # DELETE /cycles/1.json
  def destroy
    @cycle.destroy 
    flash[:success] = 'cycle berhasil di hapus'
    redirect_to admin_cycles_path 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cycle
      @cycle = Cycle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cycle_params
      params.require(:cycle).permit(:name)
    end
end
