# -*- encoding: utf-8 -*-
require File.expand_path('../lib/versionius/versionius', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Alexander Korsak"]
  gem.email         = ["alex.korsak@gmail.com"]
  gem.description   = %q{Build version txt file in the public folder}
  gem.summary       = ""
  gem.homepage      = "http://github.com/oivoodoo/versionius"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "versionius"
  gem.require_paths = ["lib"]
  gem.version       = Versionius::VERSION

  gem.add_dependency('grit')
  gem.add_dependency('versionomy')
end
