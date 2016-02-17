class User < ActiveRecord::Base
	has_many :ideas, dependent: :destroy
	has_many :likes, dependent: :destroy
	has_many :ideas_liked, through: :likes, source: :idea
	has_secure_password
	EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
	validates :name, :alias, :password, presence: true
	validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
	def self.check_session user
		valid_user = User.find_by(email: user["email"])
		if valid_user && valid_user.authenticate(user["password"])
			return {"status": true, "id": valid_user.id}
		else
			return false
		end
	end
end
