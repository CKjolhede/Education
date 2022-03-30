# app/controllers/school_students_controller.rb

class SchoolStudentsController < ApplicationController

   def index
     @school = School.find(params[:school_id])

     @students = @school.students
   end
 end
