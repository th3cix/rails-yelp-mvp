class Restaurant < ApplicationRecord
	validates :category, inclusion: { in: %w(chinese italian japanese french belgian),
		message: "%{value} is not a valid size" }
		validates :name, presence: true
		validates :address, presence: true
		has_many :reviews, dependent: :destroy
	end
