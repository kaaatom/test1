Deface::Override.new(:virtual_path  => "spree/products/show",
            :insert_bottom => "[data-hook='product_left_part']",
            :partial      => "spree/products/downloadable_links",
            :name         => "downloadable_links")
