class Customer < User

	# override User.admin method as customers can never be admins
	def admin
		return false
	end



end