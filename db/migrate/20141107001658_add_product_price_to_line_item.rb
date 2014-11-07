class AddProductPriceToLineItem < ActiveRecord::Migration
  def self.up
    add_column :line_items, :price, :decimal
  	LineItem.all.each do |item|
  		price = item.product.price
  		item.price = price
  		item.save!
  	end
  end
  def self.down
    remove_column :line_items, :price
  end
end
