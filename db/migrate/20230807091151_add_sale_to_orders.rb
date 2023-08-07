class AddSaleToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :sale, :integer
  end
end
