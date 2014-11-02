class AddPasswordToDownloadables < ActiveRecord::Migration
  def self.up
    add_column :spree_product_downloads, :password, :string
  end

  def self.down
    remove_column :spree_product_downloads, :password
  end
end