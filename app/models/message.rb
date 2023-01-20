class Message < ApplicationRecord
  validates :comment, length: { in: 3..200 }
  validates :username, presence: true

  include Moderation
end
