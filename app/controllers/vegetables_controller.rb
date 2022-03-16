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
      flash[:notice] = "Vegetable added!"
      redirect_to @veg
    else
      render 'new'
    end
  end

  def edit
    @veg = Vegetable.find(params[:id])
  end

  def update
    @veg = Vegetable.find(params[:id])
    if @veg.update(params.require(:vegetable).permit(:name, :season))
      flash[:message] = "Vegetable details updated!"
      redirect_to @veg
    else 
      render 'edit'
    end
  end

  def destroy
    @veg = Vegetable.find(params[:id])
    flash[:message] = "#{@veg.name} was successfully deleted!"
    @veg.destroy
    redirect_to vegetables_path
  end
end