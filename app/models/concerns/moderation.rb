module Moderation
  extend ActiveSupport::Concern

    included do
      validates :comment, length: { in: 3..200 }
    end

    # class_methods do
    #     debugger
    #     # response = HTTParty.get('http://api.stackexchange.com/2.2/questions?site=stackoverflow')
    #     "#{:comment}".squish
    #   end
end
