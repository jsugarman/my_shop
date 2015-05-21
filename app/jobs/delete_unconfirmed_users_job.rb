class DeleteUnconfirmedUsersJob < ActiveJob::Base

	def perform
		User.expired.destroy_all
	end

end
