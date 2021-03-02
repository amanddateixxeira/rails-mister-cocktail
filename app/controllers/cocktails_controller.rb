class CocktailsController < ApplicationController
  before_action :order_cocktail, only: [:show]

  def index 
    @cocktails = Cocktail.all
end

def show
  @cocktail = Cocktail.find(params[:id])
  
end

def new
  @cocktail = Cocktail.new
end

def create
  @cocktail = Cocktail.new(cocktail_params)
  if @cocktail.save
    redirect_to cocktail_params(@cocktail)
  
  else
    render :new
  end
end
    
private

def order_cocktail
  @cocktail = Cocktail.find(params[:id])
end  

def cocktails_params
  params.require(:cocktail).permit(:name)
 end
end

