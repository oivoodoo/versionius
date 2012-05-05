# Versionius

Library for generating version file for the project. For example if you have
several clients with standalone installation of your project and you are
planning to check versions of the app and make deployments. You can add to the
deployment hooks tasks version file builder and then access to this file
through public folder.


## Installation

Add this line to your application's Gemfile:

    gem 'versionius'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install versionius

## Usage

If you are using Rails 2 you can add to your deploy.rb or Rakefile

    require 'versionius/tasks'

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
