require 'versionius'
require 'rake'

namespace :versionius do

  desc "Generate version.txt file in the public folder"
  task :build do
    builder = Versionius::Builder.new('./', './public/')
    builder.run
  end
end
