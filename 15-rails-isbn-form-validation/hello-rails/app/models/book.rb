class Book < ApplicationRecord
	has_many :comments
	validates :title, :description, :author, presence: true
	validates :isbn, presence: true
	validates :isbn, :isbn_format => true
end
