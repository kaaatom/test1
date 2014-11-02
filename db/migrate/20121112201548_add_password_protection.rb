class AddPasswordProtection < ActiveRecord::Migration
  def self.up
    add_column :spree_product_downloads, :secret_links_only, :boolean, :default => false
  end

  def self.down
    remove_column :spree_product_downloads, :secret_links_only
  end
end