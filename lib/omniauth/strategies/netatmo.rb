require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Netatmo < OmniAuth::Strategies::OAuth2

      option :client_options, {
        :site => 'http://api.netatmo.com',
        :authorize_url => 'http://api.netatmo.net/oauth2/authorize',
        :token_url => 'http://api.netatmo.net/oauth2/token'
      }

      option :token_params, {
        :parse => :query
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

      uid { raw_info['_id'] }

      info do
        { :email => raw_info['email'] }
      end

      extra do
        { :raw_info => raw_info }
      end

      def raw_info
        @raw_info ||= access_token.get('/api/getuser').parsed || {}
      end
    end
  end
end
