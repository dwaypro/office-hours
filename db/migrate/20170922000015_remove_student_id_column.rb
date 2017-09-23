class RemoveStudentIdColumn < ActiveRecord::Migration[5.1]
  def change
    remove_column :projects, :student_id, :integer
  end
end
