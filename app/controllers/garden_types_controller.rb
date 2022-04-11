class GardenTypesController < ApplicationController

  def new
    @garden_type = GardenType.new
  end
  
  def create
    @garden_type = GardenType.new(garden_type_params)
    if @garden_type.save
      flash[:notice] = "Garden type was successfully created!"
      redirect_to @garden_type
    else
      
      render 'new'
    end
  end

  def index

  end

  def show
    
  end

  private

  def garden_type_params
    params.require(:garden_type).permit(:name)
  end

end