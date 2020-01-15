class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
    render :index
  end

  def show
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
      redirect_to recipe_path
    else
      render :new
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private
  def recipe_params
    params.require(:recipe).permit(:name, :category, :rank, :instructions)

  end

end
