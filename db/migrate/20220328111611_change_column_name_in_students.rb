class ChangeColumnNameInStudents < ActiveRecord::Migration[5.2]
  def change
    change_table :students do |t|
      t.rename :GPA, :gpa
    end
  end
end
