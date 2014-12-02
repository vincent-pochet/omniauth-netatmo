require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Netatmo < OmniAuth::Strategies::OAuth2

      option :client_options, {
        :site => 'https://api.netatmo.net/',
        :authorize_url => 'https://api.netatmo.net/oauth2/authorize',
        :token_url => 'https://api.netatmo.net/oauth2/token'
      }

      option :token_params, {
        :parse => :json,
        :grant_type => 'authorization_code'
      }

      option :access_token_options, {
        :param_name => 'access_token'
      }

      def request_phase
        super
      end

      def authorize_params
        super.tap do |params|
          %w[scope grant_type].each do |v|
            if request.params[v]
              params[v.to_sym] = request..params[v]
            end
          end
        end
      end

      uid { raw_info['body']['_id'] }

      info do
        { :email => raw_info['body']['mail'] }
      end

      extra do
        { :raw_info => raw_info }
      end

      def raw_info
        @raw_info ||= access_token.get('/api/getuser', params: { access_token: access_token.token }).parsed
      end
    end
  end
end
