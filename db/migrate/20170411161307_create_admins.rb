class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins, :id => false do |t|
      t.primary_key :admin_id
      t.string :name
      t.string :password_digest
      t.integer :program_id
      t.integer :module_id
      t.boolean :isSuperAdm
      t.boolean :isProgramAdm
    end
  end
end
