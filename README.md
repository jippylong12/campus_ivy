# CampusIvy

A clean, idiomatic Ruby interface for interact with the Campus Management API.

## Installation

Install the gem and add to the application's Gemfile by executing:

```bash
bundle add campus_ivy
```

If bundler is not being used to manage dependencies, install the gem by executing:

```bash
gem install campus_ivy
```

## Usage

### Configuration

You can configure the client globally or per instance.

**Global Configuration:**

```ruby
CampusIvy.configure do |config|
  config.api_key = 'your_api_key'
  # Optional: Set sandbox to true (defaults to false)
  config.sandbox = true 
end
```

**Environment Variables:**

You can also set the sandbox mode via an environment variable:

```bash
export CAMPUS_IVY_USE_SANDBOX=true
```

**Instance Configuration:**

```ruby
client = CampusIvy::Client.new(api_key: 'your_api_key')
```

### Account Resource

The `Account` resource allows you to manage authentication and sessions.

```ruby
client = CampusIvy::Client.new

# Generate an Access Token
token_response = client.account.token(
  institution_id: 12345,
  client_key: 'your_client_key',
  username: 'username',
  password: 'password'
)
puts token_response.access_token

# Generate Access Token with Credentials only
client.account.token_credentials(
  institution_id: 12345,
  username: 'username',
  password: 'password'
)

# Generate Access Token with Client Key only
client.account.token_key(
  institution_id: 12345,
  client_key: 'your_client_key'
)

# Logout
client.account.logout
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jippylong12/campus_ivy. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/jippylong12/campus_ivy/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the CampusIvy project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/jippylong12/campus_ivy/blob/main/CODE_OF_CONDUCT.md).
