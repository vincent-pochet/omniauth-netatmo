require 'omniauth/strategies/oauth2'

module OmniAuth
  module Strategies
    class Netatmo < OmniAuth::Strategies::OAuth2

      option :client_options, {
        :site => 'https://www.netatmo.com',
        :authorize_url => 'http://api.netatmo.net/oauth2/authorize',
        :token_url => 'http://api.netatmo.net/oauth2/token'
      }

      option :authorize_options, [:scope, :state]

      uid { raw_info['body']['_id'] }

      info do
        { :email => raw_info['body']['mail'] }
      end

      extra do
        skip_info? ? {} : { :raw_info => raw_info }
      end

      def raw_info
        @raw_info ||= access_token.get('/api/getuser').parsed || {}
      end
    end
  end
end
