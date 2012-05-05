require 'rails'

module Versionius

  class Railtie < Rails::Railtie
    railtie_name :version

    rake_tasks do
      load File.join(File.dirname(__FILE__),"../tasks/versionius.rake")
    end
  end
end
