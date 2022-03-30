# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


School.destroy_all
Student.destroy_all
school_1 = School.create!(name: "City High School", census: 200)
school_2 = School.create!(name: "City Middle School", census: 97)
school_3 = School.create!(name: "City Grade School", census: 104)
student_1 = Student.create!(name: "Abraham Adams", gpa: 1.2, freelunch: true,school_id: school_1.id)
student_11 = Student.create!(name: "Alicia Arden", gpa: 4.0, freelunch: false, school_id: school_1.id)
student_2 = Student.create!(name: "Bethany Bingham", gpa: 2.3, freelunch: false, school_id: school_2.id)
student_22 = Student.create!(name: "Bert Bond", gpa: 2.0, freelunch: true, school_id: school_2.id)
student_3 = Student.create!(name: "Cher CornCob", gpa: 3.4, freelunch: false, school_id: school_3.id)
student_33 = Student.create!(name: "Carl Cobert", gpa: 2.7, freelunch: true, school_id: school_3.id)
