class User < ActiveRecord::Base
	validates :adid, presence: true
end