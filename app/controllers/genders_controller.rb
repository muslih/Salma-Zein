class GendersController < ApplicationController
  before_action :set_gender, only: [:show, :edit, :update, :destroy]

  # GET /genders
  def index
    @genders = Gender.all
  end

  # GET /genders/new
  def new
    @gender = Gender.new
  end

  # GET /genders/1/edit
  def edit
  end

  # POST /genders
  def create
    @gender = Gender.new(gender_params)
    if @gender.save
      flash[:success] = 'Gender berhasil di tambah'
      redirect_to genders_path
    else
      @model = @gender
      flash.now[:danger] = 'Gender gagal di tambah'
      render :new
    end
  end

  # PATCH/PUT /genders/1
  def update
    if @gender.update(gender_params)
      flash[:success] = 'Gender berhasil di update'
      redirect_to genders_path
    else
      @model = @gender
      flash.now[:danger] = 'Gender gagal di update'
      render :edit 
    end
  end

  # DELETE /genders/1
  def destroy
    @gender.destroy 
    flash[:success] = 'Gender berhasil di hapus'
    redirect_to genders_path  
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gender
      @gender = Gender.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gender_params
      params.require(:gender).permit(:name)
    end
end
