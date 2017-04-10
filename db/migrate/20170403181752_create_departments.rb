class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments, :id => false do |t|
      t.primary_key :department_id
      t.string :dname
    end
  end
end
