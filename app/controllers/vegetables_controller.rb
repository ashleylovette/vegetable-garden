class VegetablesController < ApplicationController
    def show
        @veg = Vegetable.find(params[:id])
    end
end