require 'versionius'
require 'rake'

include Rake::DSL if defined?(Rake::DSL)

namespace :versionius do

  desc "Generate version.txt file in the public folder"
  task :build do
    builder = Versionius::Builder.new('./', './public/')
    builder.run
  end

  desc "Create minor tag"
  task :minor do
    version = Versionius::Version.new('./')
    version.minor
  end

  desc "Create major tag"
  task :major do
    version = Versionius::Version.new('./')
    version.major
  end


  desc "Create release tag"
  task :release do
    version = Versionius::Version.new('./')
    version.release
  end
end

