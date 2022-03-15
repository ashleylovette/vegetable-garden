class VegetablesController < ApplicationController
  def show
    @veg = Vegetable.find(params[:id])
  end

  def index
    @veggies = Vegetable.all
  end

  def new
     @veg = Vegetable.new
  end

  def create
    @veg = Vegetable.new(params.require(:vegetable).permit(:name, :season))

    if @veg.save
      redirect_to @veg
    else
      render 'new'
    end
    
  end
end