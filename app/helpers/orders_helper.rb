module OrdersHelper
	def revenue orders
		total = 0
		orders.each { |order| total += order.item_price  * order.purchase_count }
		total
	end
end
