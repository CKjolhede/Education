class AddBooleanToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :freelunch, :boolean
  
  end
end
