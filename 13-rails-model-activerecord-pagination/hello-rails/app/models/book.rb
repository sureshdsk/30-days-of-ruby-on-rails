class Book < ApplicationRecord
	has_many :comments
	validates :title, :description, :author, presence: true
end
