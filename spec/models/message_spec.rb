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
  describe "Moderation" do
    it "should call the API and obtain the score" do
      message = Message.create(username: 'Hermann', comment: 'Article épatant')

      allow(message).to receive(:moderation).and_return('{"prediction"=>{"0"=>0.022937463372945786}}')
    end
  end

end
