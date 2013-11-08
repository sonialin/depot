class StoreController < ApplicationController
  def index
  	# display products
  	@products = Product.order("created_at DESC")

  	# session counter for the times the user has visited
  	@count = increment_counter
    @time = Time.now
  end

		# session counter method
	def increment_counter
	  if session[:counter].nil?
	    session[:counter] = 0
	  end
	  session[:counter] += 1
	end
end
