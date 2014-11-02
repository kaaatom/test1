Deface::Override.new(:virtual_path => "spree/admin/shared/_product_tabs",
                     :name => "add_downloadables_tab",
                     :insert_bottom => "[data-hook='admin_product_tabs']",
                     :partial => "spree/admin/shared/product_downloadables_tab",
                     :disabled => false)