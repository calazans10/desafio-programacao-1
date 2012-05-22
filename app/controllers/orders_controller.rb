class OrdersController < ApplicationController
	def new
		@orders = current_user.orders.all
	end

	def upload
		if params[:file]
			regexp = /([^\t]+|\t(?=\t)|\t$)\s([^\t]+|\t(?=\t)|\t$)\s([^\t]+|\t(?=\t)|\t$)\s([^\t]+|\t(?=\t)|\t$)\s([^\t]+|\t(?=\t)|\t$)\s([^\t]+|\t(?=\t)|\t$)/

  		lines = params[:file].tempfile.readlines.map(&:chomp)
			lines.shift
			lines.each do |l|
				m = l.match(regexp)
				@order = current_user.orders.create({ purchaser_name: m[1], item_description: m[2], item_price: m[3],purchase_count: m[4], merchant_address: m[5], merchant_name: m[6] })
			end
		end
	end
end
