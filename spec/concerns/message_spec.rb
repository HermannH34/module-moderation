require 'rails_helper'

RSpec.describe Moderation do
  before do
    @message = Message.create(username: 'Hermann', comment: 'Article épatant')
  end
  describe "Moderation" do
    it "should call the API and obtain the score" do
      allow(@message).to receive(:moderation).and_return('{"prediction"=>{"0"=>0.032937463372945786}}')
    end
    it "should check if message is accepted" do
      message2 = Message.create(username: 'Hermann', comment: 'Je déteste ce que vous affirmez, je vais vous tuer!')

      expect(@message[:is_accepted]).to eq(true)
      expect(message2[:is_accepted]).to eq(false)
    end
  end

end
