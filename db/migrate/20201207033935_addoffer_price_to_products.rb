class AddofferPriceToProducts < ActiveRecord::Migration[6.0]
  def change
  	add_column :products, :offer_price, :decimal
  end
end
