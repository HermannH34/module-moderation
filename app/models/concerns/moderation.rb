module Moderation
  extend ActiveSupport::Concern

  included do
    validates :comment, length: { in: 3..200 }
  end
end
