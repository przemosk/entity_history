# EntityHistory

Simple tool for catching changes around model entity.

## Installation

Add to your `Gemfile`:

`gem "entity_history"`

then, run installer:

`rails generate entity_history:install` which copy `entity_history.rb`file into your `initializer` directory. ( please remember about restart your app server)

`rails generate entity_history:copy_migration` this task will copy required migration into your application


`rails db:migrate`
...

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/entity_history. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/entity_history/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the EntityHistory project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/entity_history/blob/main/CODE_OF_CONDUCT.md).
