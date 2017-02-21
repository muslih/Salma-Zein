class Admin::EmployeesController < AdminController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]

  # GET /employees
  def index
    @employees = Employee.all
  end

  # GET /employees/new
  def new
    @employee = Employee.new
  end

  # GET /employees/1/edit
  def edit
  end

  # POST /employees
  def create
    @employee = Employee.new(employee_params)
    @employee.user_id = current_user.id
    if @employee.save
      flash[:success] = 'Pegawai berhasil di tambah'
      redirect_to admin_employees_path
    else
      flash.now[:danger] = 'Pegawai gagal di tambah'
      @model = @employee
      render :new
    end
  end

  # PATCH/PUT /employees/1
  def update
    if @employee.update(employee_params)
      flash[:success] = 'Pegawai berhasil di update'
      redirect_to admin_employees_path
    else
      @model = @employee
      flash.now[:danger] = 'Pegawai gagal di update'
      render :edit 
    end
  end

  # DELETE /employees/1
  def destroy
    @employee.destroy 
    flash[:success] = 'Pegawai berhasil di hapus'
    redirect_to admin_employees_path  
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_params
      params.require(:employee).permit(:name, :role, :age, :birth_place, :birth_date, :gender_id, :religion_id, :position_id, :education_id, :experience, :skill, :user_id)
    end
end
