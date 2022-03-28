GPAclass CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :name
      t.float :gpa

      t.timestamps
    end
  end
end
