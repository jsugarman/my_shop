class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable,:confirmable

  class << self
		def unconfirmed
			where(confirmed_at: nil)
		end

		def expired(expired_at=2.weeks.ago)
			unconfirmed.where(arel_table[:created_at].lt(expired_at))		
		end

		def like_name(name)
			where(arel_table[:name].matches(name))
		end

	end

  def send_devise_notification(notification, *args)
  	devise_mailer.send(notification, self, *args).deliver_later
	end


end
