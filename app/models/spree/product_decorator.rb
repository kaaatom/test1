Spree::Product.class_eval do
	has_many :downloadables, :as => :viewable, :dependent => :destroy
end