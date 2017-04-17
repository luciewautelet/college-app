class CreatePrograms < ActiveRecord::Migration
  def change
    create_table :programs, :id => false do |t|
      t.primary_key :program_id
      t.integer :admin_id
      t.string :pname
    end
  end
end
