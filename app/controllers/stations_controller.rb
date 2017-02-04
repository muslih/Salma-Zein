class StationsController < ApplicationController
  before_action :set_station, only: [:show, :edit, :update, :destroy]

  # GET /stations
  def index
    @stations = Station.all
  end

  # GET /stations/1
  def show
  end

  # GET /stations/new
  def new
    @station = Station.new
  end

  # GET /stations/1/edit
  def edit
  end

  # POST /stations
  def create
   @station = Station.new(station_params)
    if @station.save
      redirect_to stations_path
    else
      render :new
    end
  end

  # PATCH/PUT /stations/1
  def update
    if @station.update(station_params)
      redirect_to stations_path
    else
      @model = @station
      render :edit 
    end
  end

  # DELETE /stations/1
  def destroy
    @station.destroy 
    redirect_to stations_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_station
      @station = Station.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def station_params
      params.require(:station).permit(:name)
    end
end
