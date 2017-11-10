# Oasis

Oasis is a gem to transform JSON requests payloads keys into snake_case,
and transform JSON responses bodies keys into camelCase.

This was released as Ruby backend convention is to use snake_case variables
and attributes names, while javascript frontend convention is to use
camelCase for the same purposes.

Oasis offers a middleware that make this transformations of requests and responses
to the Rack application.

Both the snake and the camel are desert animals, that meet on Oasis.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'oasis'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install oasis

## Usage

Right now this middleware will only work for Rails application,
but future releases shall support any Rack based application.

For Rails:

Application wide:
```
# config/application.rb

config.middleware.insert_after ActionDispatch::ParamsParser, 'Oasis::RequestSnakelizer'
config.middleware.insert_after 'Oasis::RequestSnakelizer', 'Oasis::ResponseCamelizer'
```

Per controller:
Application wide:
```
use Oasis::RequestSnakelizer
use Oasis::ResponseCamelizer
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).


## Warnings
Current implementation requires Rails, as it is usign Rails specific ActiveSupport methods (for camelize and underscore),
as well as using Rails generated Rack `env` keys.

For requests translations, only request parameters will be translated, query parameters names won't be translated.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/oasis.
