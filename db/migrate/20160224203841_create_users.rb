class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :coname
      t.string :ownername
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
