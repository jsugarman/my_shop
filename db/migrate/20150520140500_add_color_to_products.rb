class AddColorToProducts < ActiveRecord::Migration
  def change

  	change_table :products do |t|
  		t.string :color, limit: 30
  	end

  end
end
