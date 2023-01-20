require 'rails_helper'

RSpec.describe Moderation do
  describe "Moderation" do
    it "should call the API and obtain the score" do
      message = Message.create(username: 'Hermann', comment: 'Article épatant')

      allow(message).to receive(:moderation).and_return('{"prediction"=>{"0"=>0.032937463372945786}}')
    end
    it "should check if message is accepted" do
      message1 = Message.create(username: 'Hermann', comment: 'Excellent article!')
      message2 = Message.create(username: 'Hermann', comment: 'Je déteste ce que vous affirmez, je vais vous tuer!')

      expect(message1[:is_accepted]).to eq(true)
      expect(message2[:is_accepted]).to eq(false)
    end
  end

end
