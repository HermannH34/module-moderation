require "json"
require "open-uri"

class Message < ApplicationRecord
  # include Moderation
  validates :comment, length: { in: 3..200 }
  validates :username, presence: true

  before_validation :moderation

  private

  def moderation
    # self.comment = "hello"
    url = "https://moderation.logora.fr/"
    user_serialized = URI.open(url).read
    user = JSON.parse(user_serialized)
    debugger

  end
end
