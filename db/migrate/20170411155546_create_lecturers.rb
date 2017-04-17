class CreateLecturers < ActiveRecord::Migration
  def change
    create_table :lecturers, :id => false do |t|
      t.primary_key :lecturer_id
      t.string :name
      t.string :password_digest
      t.string :course_modules
    end
  end
end
