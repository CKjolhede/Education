#app/controllers/schools_controller.rb

class SchoolsController < ApplicationController

  def index
    @schools = School.all.in_order
  end

  def show
    @school = School.find(params[:id])
  end

end
