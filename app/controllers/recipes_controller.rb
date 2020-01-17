class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
    render :index
  end

  def show
    @ingredients = Ingredient.all
    @recipe = Recipe.find(params[:id])
    @needed_ingredients = @recipe.ingredients
    render :show
  end

  def new
    @recipe = Recipe.new
    render :new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      flash[:nugget] = "Recipe Successfully Added"
      redirect_to recipes_path
    else
      render :new
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
    render :edit
  end

  def update
    @recipe = Recipe.find(params[:id])
    if params.has_key?(:selected)
      @recipe.ingredients << Ingredient.find(params[:selected].fetch(:ingredient_id))
      redirect_to recipe_path
    elsif @recipe.update(recipe_params)
      redirect_to recipes_path
    else
      render :edit
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path
  end



  private
  def recipe_params
    params.require(:recipe).permit(:name, :category, :rank, :instructions)

  end

end
