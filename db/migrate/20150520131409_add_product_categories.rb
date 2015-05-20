class AddProductCategories < ActiveRecord::Migration
  def change
  	
  	create_table :categories do |t|

  			t.string :name, limit: 100, null: false
  			t.string :slug, limit: 100, null: false
  			t.text :description, limit: 2000

  			t.timestamps null: false

  	end

  	create_join_table :categories, :products do |t|
  		t.index :product_id
  		t.index :category_id
  	end

  end
end
