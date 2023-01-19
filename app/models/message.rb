class Message < ApplicationRecord
  validates :username, presence: true
  validates :comment, length: { in: 3..200 }
end
