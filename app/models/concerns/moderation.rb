module Moderation
  extend ActiveSupport::Concern

    included do
      before_create :moderation
    end

    def moderation
      uri = URI('https://moderation.logora.fr/predict')
      params = { :text => "#{comment}" }
      uri.query = URI.encode_www_form(params)
      res = Net::HTTP.get_response(uri)
      # res = callApi(uri)
      prediction = JSON.parse(res.body)

      prediction["prediction"]["0"].round(2) >= 0.09 ? self.is_accepted = false : self.is_accepted = true
    end
end
