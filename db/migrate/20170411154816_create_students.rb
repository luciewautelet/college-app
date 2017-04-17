class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students, :id => false do |t|
      t.primary_key :student_id
      t.string :name
      t.string :password_digest
      t.string :course_module_ids
      t.integer :program_id
    end
  end
end
