class CreateRegulars < ActiveRecord::Migration
  def change
    create_table :regulars do |t|
      t.string :fname
      t.string :lname
      t.integer :phone
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
