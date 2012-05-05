require 'grit'

module Versionius

  class Builder
    def initialize(repository_path, version_file_path)
      @repository_path = repository_path
      @version_file_path = version_file_path
    end

    def run
      repo = Grit::Repo.new(@repository_path)

      File.open(File.join(@version_file_path, Versionius::FILE_NAME), "w+") do |file|
        tag = repo.tags.last
        unless tag.nil?
          file.puts "#{Versionius::TAG_TITLE} #{tag.name}"

          commits = between_tags(repo) if repo.tags.size > 1
        end

        (commits || repo.commits).each do |commit|
          file.puts commit.message
        end
      end
    end
  end

  def between_tags(repo)
    commits = []
    previous = repo.tags[repo.tags.size - 2]

    for commit in repo.commits
      break if commit.id == previous.commit.id

      commits << commit
    end

    commits
  end
end

