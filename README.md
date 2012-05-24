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

If you are using Rails 2 version you should add load method to your Rakefile:

```ruby
  load "#{Gem.searcher.find('versionius').full_gem_path}/lib/tasks/deployments.rake"
```

Now we can create a custom deploy task for capistrano like that:

```ruby
  before 'deploy' do
    sh <<-CMD
      rake versionius:minor
    CMD
  end

  after 'deploy' do
    run <<-CMD
      rake versionius:build
    CMD
  end
```

It will create a minor version of the project(new tag), make 'git push --tags
origin master', generate new version.txt file in the public folder after
deployment.

Also you can run code manually to generate version.txt file or create new tag.

```ruby
  builder = Versionius::Builder.new('./', './public/')
  builder.run

  version = Versionius::Version.new('./')
  version.minor
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
