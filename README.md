[![Build Status](https://travis-ci.org/marcomoura/cnab150.svg)](https://travis-ci.org/marcomoura/cnab150)
[![Coverage Status](https://coveralls.io/repos/marcomoura/cnab150/badge.svg?branch=master&service=github)](https://coveralls.io/github/marcomoura/cnab150?branch=master)

# Cnab150

Client of cnab-150 return file.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cnab150'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cnab150

## Usage

  Cnab150.parse_registries(['array of registries', 'another registry'])

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/marcomoura/cnab150.

