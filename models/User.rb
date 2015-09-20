class User < ActiveRecord::Base
	validates :adid, presence: true
	has_many :redirects, dependent: :destroy
end