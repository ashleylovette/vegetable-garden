class VegetablesController < ApplicationController

  before_action :set_vegetable, only: [:show, :edit, :destroy, :update]

  def show
  end

  def index
    @veggies = Vegetable.all
  end

  def new
     @veg = Vegetable.new
  end

  def create
    @veg = Vegetable.new(vegetable_params)

    if @veg.save
      flash[:notice] = "Vegetable added!"
      redirect_to @veg
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @veg.update(vegetable_params)
      flash[:message] = "Vegetable details updated!"
      redirect_to @veg
    else 
      render 'edit'
    end
  end

  def destroy
    flash[:message] = "#{@veg.name} was successfully deleted!"
    @veg.destroy
    redirect_to vegetables_path
  end

  private

  def set_vegetable
    @veg = Vegetable.find(params[:id])
  end

  def vegetable_params
    params.require(:vegetable).permit(:name, :season)
  end
end