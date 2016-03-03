class EditRegularsTable < ActiveRecord::Migration
  def change
  	remove_column :regulars, :phone
  	add_column :regulars, :phone, :string
  	add_column :regulars, :subscribed, :boolean
  end

end
