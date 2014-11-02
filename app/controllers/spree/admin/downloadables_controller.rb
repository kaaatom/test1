module Spree
	module Admin
		class DownloadablesController < ResourceController
			before_filter :load_data

		  create.before :set_viewable
		  update.before :set_viewable

		  belongs_to "spree/product", :find_by => "permalink"

		  def edit
		  	@downloadable = Spree::Downloadable.find(params[:id])
		  end

		  private

	    def load_data
	    	@downloadable = Spree::Downloadable.new
	      @product = Spree::Product.find_by_permalink(params[:product_id])
	    end

	    def set_viewable
	      @downloadable.viewable_type = 'Product'
	      @downloadable.viewable_id = @product.id
	    end

		end
	end
end