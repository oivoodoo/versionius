require 'grit'
require 'versionomy'

module Versionius

  class Version
    def initialize(project_path)
      @repo = Grit::Repo.new(project_path)
      @version = Versionomy.parse(tag.name)
    end

    def minor
      change(@version.bump(2))
    end

    def major
      change(@version.bump(1))
    end

    def release
      change(@version.bump(0))
    end

    private

    def tag
      @repo.tags.last || NoTag.new
    end

    def tag_version(version)
      sh "git tag #{version}"
    end

    def git_push
      sh "git push origin master"
    end

    def change(version)
      tag_version(version.to_s)
      git_push
    end

    class NoTag
      def name
        "0.0.0"
      end
    end
  end
end
