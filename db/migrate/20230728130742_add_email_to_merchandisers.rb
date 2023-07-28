class AddEmailToMerchandisers < ActiveRecord::Migration[7.0]
  def change
    add_column :merchandisers, :email, :string
  end
end
