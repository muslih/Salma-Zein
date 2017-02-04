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
      redirect_to educations_path
    else
      render :new
    end
  end

  # PATCH/PUT /educations/1
  def update
    if @education.update(education_params)
      redirect_to educations_path
    else
      @model = @education
      render :edit 
    end
  end

  # DELETE /educations/1
  def destroy
    @education.destroy 
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
