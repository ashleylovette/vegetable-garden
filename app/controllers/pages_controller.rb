class PagesController < ApplicationController
    def home
        redirect_to vegetables if logged_in?
    end
    def about

    end
end