#app/controllers/schools_controller.rb

class SchoolsController < ApplicationController

  def index
    @schools = School.all.in_order
  end

  def new
  end

  def show
    @school = School.find(params[:id])
  end

  def create
    @new_school = School.create!(
      name: (params[:name]),
      census: (params[:census]))
      # require "pry"; binding.pry
    redirect_to "/schools/#{@new_school.id}"
  end

end
