class DosesController < ApplicationController
  before_action :order_cocktail, only: [:new, :create]

def create
  @dose = Dose.new(dose_params)
  @cocktail = Cocktail.find(params[:cocktail_id])
  @dose.cocktail = @cocktail
  
  if @dose.save
    redirect_to cocktail_path(@cocktail)
  else
    render :new
  end
end

def new
  @dose = Dose.new
  @cocktail = Cocktail.find(params[:cocktail_id])
end

def destroy
  @dose = Dose.find(params[:id])
  @cocktail = @dose.cocktail
  @dose.destroy
  redirect_to cocktail_path(@cocktail)
end

private
def order_cocktail
  @cocktail = Cocktail.find(params[:cocktail_id])
end

def dose_params
  params.require(:dose).permit(:description, :ingredient_id)
end

def ingredient_params
  params.require(:ingredient).permit(:name)
 end
end
