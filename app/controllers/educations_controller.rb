class EducationsController < ApplicationController
  before_action :set_education, only: [:show, :edit, :update, :destroy]

  # GET /educations
  def index
    @educations = Education.all
  end

  # GET /educations/new
  def new
    @education = Education.new
  end

  # GET /educations/1/edit
  def edit
  end

  # POST /educations
  def create
    @education = Education.new(education_params)
    if @education.save
      flash[:success] = 'Pendidikan berhasil di tambah'
      redirect_to educations_path
    else
      @model = @education
      flash.now[:danger] = 'Pendidikan gagal di tambah'
      render :new
    end
  end

  # PATCH/PUT /educations/1
  def update
    if @education.update(education_params)
      flash[:success] = 'Pendidikan berhasil di update'
      redirect_to educations_path
    else
      @model = @education
      flash.now[:danger] = 'Pendidikan gagal di update'
      render :edit 
    end
  end

  # DELETE /educations/1
  def destroy
    @education.destroy 
    flash[:success] = 'Pendidikan berhasil di hapus'
    redirect_to educations_path 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_education
      @education = Education.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def education_params
      params.require(:education).permit(:name)
    end
end
