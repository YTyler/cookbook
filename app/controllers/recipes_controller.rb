class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
    render :index
  end

  def show
    @ingredients = Ingredient.all
    @recipe = Recipe.find(params[:id])
    render :show
  end

  def new
    @recipe = Recipe.new
    render :new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
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
    if @recipe.update(recipe_params)
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
