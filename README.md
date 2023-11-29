# EntityHistory

Simple tool for catching changes around model entity.

## Background

TODO

## Installation

Add to your **Gemfile**:

`gem "entity_history", git: "https://github.com/przemosk/entity_history"`

run installer:

`rails generate entity_history:install`
which copy `entity_history.rb`file into your `initializer` directory. ( please remember about restart your app server)

copy migration into your app:`rails generate entity_history:copy_migration`

run migration: `rails db:migrate`


## Usage

After successful database migration, the next step is to include into model prepared concern which allow track changes on specific entity as below

```
class Book
  include EntityEvents

  # or you can use mehthod

  log_entity_history

end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/entity_history. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/entity_history/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the EntityHistory project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/entity_history/blob/main/CODE_OF_CONDUCT.md).
