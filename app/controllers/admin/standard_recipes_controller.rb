class Admin::StandardRecipesController < AdminController
  before_action :set_standard_recipe, only: [:show, :edit, :update, :destroy]

  # GET /standard_recipes
  def index
    @standard_recipes = StandardRecipe.all
  end

  # GET /standard_recipes/1
  def show
  end

  # GET /standard_recipes/new
  def new
    @standard_recipe = StandardRecipe.new
  end

  # GET /standard_recipes/1/edit
  def edit
  end

  # POST /standard_recipes
  def create
    @standard_recipe = StandardRecipe.new(standard_recipe_params)
    if @standard_recipe.save
      flash[:success] = 'Standard Recipe berhasil di tambah'
      redirect_to admin_standard_recipes_path
    else
      @model = @standard_recipe
      flash.now[:danger] = 'Standard Recipe gagal di tambah'
      render :new
    end
  end

  # PATCH/PUT /standard_recipes/1
  def update
    if @standard_recipe.update(standard_recipe_params)
      flash[:success] = 'Standard Recipe berhasil di update'
      redirect_to admin_standard_recipes_path
    else
      @model = @standard_recipe
      flash.now[:danger] = 'Standard Recipe gagal di update'
      render :edit 
    end
  end

  # DELETE /standard_recipes/1
  def destroy
    @standard_recipe.destroy 
    flash[:success] = 'Standard Recipe berhasil di hapus'
    redirect_to admin_standard_recipes_path  
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_standard_recipe
      @standard_recipe = StandardRecipe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def standard_recipe_params
      params.require(:standard_recipe).permit(:cycle_id, :flight_type_id, :name, :pax_qty)
    end
end
