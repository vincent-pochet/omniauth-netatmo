# -*- encoding: utf-8 -*-
require File.expand_path('../lib/omniauth/netatmo/version', __FILE__)

Gem::Specification.new do |s|
  s.name        = "omniauth-netatmo"
  s.version     = OmniAuth::Netatmo::VERSION
  s.authors     = ["Vincent Pochet"]
  s.email       = ["vincent@ruby42.com"]
  s.homepage    = "https://github.com/vincent-pochet/omniauth-netatmo"
  s.summary     = "Netatmo OAuth2 Strategy for OmniAuth"
  s.license     = "MIT"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency 'omniauth', '~> 1.0'
  s.add_dependency 'omniauth-oauth2', '~> 1.1'
  s.add_development_dependency 'rake', '~> 10.4.0'
  s.add_development_dependency 'rspec', '~> 2.7'
  s.add_development_dependency 'rack-test'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'webmock'
end
