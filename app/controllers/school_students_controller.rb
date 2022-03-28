class SchoolStudentsController < ApplicationController

   def index
     school = School.find(params[:school_id])
     # require "pry"; binding.pry
     @students = school.students
   end
 end
