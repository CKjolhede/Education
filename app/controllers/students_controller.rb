#app/controllers/students_controller.rb

class StudentsController < ApplicationController

  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
    @school = School.find(params[:id])
  end

  def create
    @school = School.find(params[:id])
    student = @school.students.create!(student_params)
    student.save
    redirect_to "/schools/#{@school.id}/students"
  end

  private
  def student_params
    params.permit(:name, :gpa, :freelunch)
  end
end
