#Description
This spree extension allows adminusers to attach files to products and have them downloadable on the product page.

This fork has been updated to use Rails 3.2 and SpreeCommerce 1.3. You can now also add secret links that will not be displayed on the product page and can not be downloaded unless the correct secret hash is specified. This makes it perfect for including in confirmation emails to offer digital extras to customers of certain products.

#Installation
Add to Gemfile:
```ruby
gem 'product_attachments', :git => 'git@github.com:nickfrandsen/spree-product-attachment.git'
```

Run:
```ruby
rake product_attachments:install:migrations
rake db:migrate
```