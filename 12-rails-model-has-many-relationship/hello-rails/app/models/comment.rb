class Comment < ApplicationRecord
  belongs_to :book
  validates :commenter, :message, presence: true
end
