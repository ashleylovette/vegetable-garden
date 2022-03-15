class PagesController < ApplicationController
    def home
        render template: "/home"
    end
end