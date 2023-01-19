require "json"
require "open-uri"
require 'net/http'

class Message < ApplicationRecord
  # include Moderation
  validates :comment, length: { in: 3..200 }
  validates :username, presence: true

  before_create :moderation

  private

  def moderation
    uri = URI('https://moderation.logora.fr/predict')
    params = { :text => "#{comment}" }
    uri.query = URI.encode_www_form(params)
    # res = Net::HTTP.get_response(uri)
    res = callApi(uri)
    prediction = JSON.parse(res.body)
    # debugger
  end

  def callApi(uri)
    Net::HTTP.get_response(uri)
  end
end
