class VegetablesController < ApplicationController

  before_action :set_vegetable, only: [:show, :edit,:update, :destroy]
  before_action :require_user, except: [:show, :index]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def show
  end

  def index
    @veggies = Vegetable.paginate(page: params[:page], per_page: 5)
  end

  def new
     @veg = Vegetable.new
  end

  def create
    @veg = Vegetable.new(vegetable_params)
    @veg.user = current_user

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

  def sort_az
    @veggies = Vegetable.order_az.paginate(page: params[:page], per_page: 5)
    render 'index'
  end

  def sort_za
    @veggies = Vegetable.order_za.paginate(page: params[:page], per_page: 5)
    render 'index'
  end

  private

  def set_vegetable
    @veg = Vegetable.find(params[:id])
  end

  def vegetable_params
    params.require(:vegetable).permit(:name, :season, :conditions, garden_type_ids: [])
  end

  def require_same_user
    if current_user != @veg.user && !current_user.admin?
      flash[:alert] = "You can only edit your own vegetable"
      redirect_to @veg
    end
  end
end