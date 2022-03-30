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
    @new_school = School.create!(school_params)
    @new_school.save
    redirect_to "/schools/#{@new_school.id}"
  end

  def edit
    @school = School.find(params[:id])
  end

  def update
    @school = School.find(params[:id])
    @school.update(school_params)
    redirect_to "/schools/#{@school.id}"
  end

  private
  def school_params
    params.permit(:name, :census)
  end
end
