class CreateCourseModules < ActiveRecord::Migration
  def change
    create_table :course_modules, :id => false do |t|
      t.primary_key :course_module_id
      t.string :mname
      t.integer :program_id
      t.integer :lecturer_id
      t.integer :admin_id
      t.timestamp :deadline
    end
  end
end
