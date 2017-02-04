class ReligionsController < ApplicationController
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
      redirect_to religions_path
    else
      render :new
    end
  end

  # PATCH/PUT /religions/1
  def update
    if @religion.update(religion_params)
      redirect_to religions_path
    else
      @model = @religion
      render :edit 
    end
  end

  # DELETE /religions/1
  def destroy
    @religion.destroy 
    redirect_to religions_path
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
