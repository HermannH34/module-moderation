require "json"
require "open-uri"
require 'net/http'

module Moderation
  extend ActiveSupport::Concern

  included do
    before_create :moderation

    private

    def moderation
      uri = URI('https://moderation.logora.fr/predict')
      params = { :text => "#{comment}" }
      uri.query = URI.encode_www_form(params)
      res = Net::HTTP.get_response(uri)
      prediction = JSON.parse(res.body)
      # si le score de prédiction est supérieur à 0.09 le commentaire n'est pas accepté
      prediction["prediction"]["0"].round(2) >= 0.09 ? self.is_accepted = false : self.is_accepted = true
    end
  end
end
