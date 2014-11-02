class RenameProductDownloadsToSpreProductDownloads < ActiveRecord::Migration
  def up
	rename_table :product_downloads, :spree_product_downloads
  end

  def down
	rename_table :spree_product_downloads, :product_downloads
  end
end
