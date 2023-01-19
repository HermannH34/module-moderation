class Message < ApplicationRecord
  include Moderation
  validates :username, presence: true
end
