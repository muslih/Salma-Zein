class PositionsController < ApplicationController
  before_action :set_position, only: [:show, :edit, :update, :destroy]

  # GET /positions
  def index
    @positions = Position.all
  end

  # GET /positions/new
  def new
    @position = Position.new
  end

  # GET /positions/1/edit
  def edit
  end

  # POST /positions
  def create
    @position = Position.new(position_params)
    if @position.save
      redirect_to positions_path
    else
      render :new
    end
  end

  # PATCH/PUT /positions/1
  def update
    if @position.update(position_params)
      redirect_to positions_path
    else
      @model = @position
      render :edit 
    end
  end

  # DELETE /positions/1
  def destroy
    @position.destroy 
    redirect_to positions_path 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_position
      @position = Position.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def position_params
      params.require(:position).permit(:name, :department_id)
    end
end
