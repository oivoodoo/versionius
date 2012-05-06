require "versionius/versionius"
require "versionius/builder"
require "versionius/tasks"
require "versionius/version"

require "versionius/railtie" if defined?(Rails) and Rails.version > "3.0.0"

module Versionius
  FILE_NAME = 'version.txt'
  TAG_TITLE = 'Version:'
end

