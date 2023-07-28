class AddPasswordDigestToMerchandesisers < ActiveRecord::Migration[7.0]
  def change
    add_column :merchandisers, :password_digest, :string

  end
end
