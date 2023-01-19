require 'rails_helper'

RSpec.describe Message, type: :model do
  describe "message validation" do
    it "should add a message with comment" do
      message = Message.create(username: 'Hermann', comment: ':)')

      expect(message.errors).to include(:comment)
      # validate_length_of(:comment).is_at_least(3)
    end
    it "should persist a message" do
      Message.create(username: 'Hermann', comment: 'Article épatant')

      expect(Message.count).to eq(1)
    end
  end

end
