class DosesController < ApplicationController
  before_action :order_cocktail, only: [:new, :create]

  def new
    @dose = Dose.new
end

def create
  @dose = Dose.new(dose_params)
  @dose.cocktail = @cocktail
  @dose.ingredient = Ingredient.find(params[:dose] [:ingredient])
  if @dose.save
    redirect_to cocktail_path(@cocktail)
  else
    render :new
  end
end

def destroy
  @dose = dose.find(params[:id])
  @dose.destroy
  redirect_to cocktail_params
end

def dose_params
  params.require(:dose).permit(description, :ingredient_id)
 end
end
