class GardenTypesController < ApplicationController
  before_action :require_admin, except: [:index, :show]

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
    @garden_types = GardenType.all
  end

  def show
    @garden_type = GardenType.find(params[:id])
  end

  private

  def garden_type_params
    params.require(:garden_type).permit(:name)
  end

  def require_admin
    if !(logged_in? && current_user.admin?)
      flash[:alert] = "Only admins can preform this action!"
      redirect_to garden_types_path
    end
  end

end