class Admin::UsersController < AdminController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  def index
    @users = User.all
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @employee = Employee.all
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'User berhasil di tambah'
      redirect_to admin_users_path
    else
      flash[:danger] = 'User gagal di tambah'
      @model = @user
      render :new
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      flash[:success] = 'User berhasil di update'
      redirect_to admin_users_path
    else
      @model = @user
      flash[:danger] = 'User gagal di update'
      render :edit 
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy 
    flash[:success] = 'User berhasil di hapus'
    redirect_to admin_users_path  
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end
end
