class DepartmentsController < ApplicationController
  before_action :set_department, only: [:show, :edit, :update, :destroy]

  # GET /departments
  def index
    @departments = Department.all
  end

  # GET /departments/new
  def new
    @department = Department.new
  end

  # GET /departments/1/edit
  def edit
  end

  # POST /departments
  def create
    @department = Department.new(department_params)
    if @department.save
      redirect_to departments_path
    else
      render :new
    end
  end

  # PATCH/PUT /departments/1
  def update
    if @department.update(department_params)
      redirect_to departments_path
    else
      @model = @department
      render :edit 
    end
  end

  # DELETE /departments/1
  def destroy
    @department.destroy 
    redirect_to departments_path 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_department
      @department = Department.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def department_params
      params.require(:department).permit(:station_id, :name, :manager)
    end
end
