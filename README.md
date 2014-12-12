# OmniAuth Netatmo &nbsp;[![Build Status](https://travis-ci.org/vincent-pochet/omniauth-netatmo.svg)](https://travis-ci.org/vincent-pochet/omniauth-netatmo)

This gem contains the [Natatmo](https://www.netatmo.com/) strategy for OmniAuth.

## Before You Begin

You should have already installed OmniAuth into your app; if not, read the [OmniAuth README](https://github.com/intridea/omniauth) to get started.

Now sign in into the [Netatmo developer area](https://dev.netatmo.com) and create an application.

## Using This Strategy

First start by adding this gem to your Gemfile:

```ruby
gem 'omniauth-netatmo'
```

Next, tell OmniAuth about this provider. For a Rails app, your `config/initializers/omniauth.rb` file should look like this:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :netatmo, "API_KEY", "API_SECRET"
end
```

Replace `"API_KEY"` and `"API_SECRET"` with the appropriate values you obtained [earlier](https://dev.netatmo.com).

## Authentication Hash
An example auth hash available in `request.env['omniauth.auth']`:

```ruby
{
  :provider => "netatmo",
  :uid => "123456",
  :info => {
    :email => 'foobar@test.com'
  },
  :credentials => {
    :token => "a1b2c3d4...", # The OAuth 2.0 access token
    :secret => "abcdef1234"
  },
  :extra => {
    :access_token => "", # An OAuth::AccessToken object
    :raw_info => {
      "status" => "ok",
      "body" => {
        "_id" => "ABCDEFGHJK",
        "administrative" => {
          "country" => "FR",
          "reg_locale" => "fr",
          "lang" => "fr",
          "unit" => 0,
          "windunit" => 0,
          "pressureunit" => 0,
          "feel_like_algo" => 0
        },
        "date_creation" => {
          "sec" => 1417420611,
          "usec" => 0
        },
        "mail" => "foo@bar.com"
      },
      "time_exec" => 0.084523916244507,
      "time_server" => 1417421657
    }
  }
}
```

## Supported Rubies

OmniAuth Netatmo is tested under 1.9.3, 2.0.0, 2.1.0, JRuby, and Rubinius.

## License

Copyright (c) 2011 by Vincent Pochet

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.