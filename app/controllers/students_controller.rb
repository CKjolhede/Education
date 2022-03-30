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

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])
    @student.update(student_params)
    redirect_to "/students/#{@student.id}"
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy
    redirect_to '/students'
  end

  private
  def student_params
    params.permit(:name, :gpa, :freelunch)
  end
end
