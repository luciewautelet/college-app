class CreateProgrammes < ActiveRecord::Migration
  def change
    create_table :programmes, :id => false do |t|
      t.primary_key :code
      t.string :pname
      t.integer :department_id
    end
  end
end
