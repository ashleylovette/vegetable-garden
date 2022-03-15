class VegetablesController < ApplicationController
    def show
        @veg = Vegetable.find(params[:id])
    end

    def index
        @veggies = Vegetable.all
    end

    def new

    end

    def create
        
    end
end