require 'spec_helper'

include Versionius

describe Builder do

  before do
    @builder = Builder.new(repository_path, './tmp/')
  end

  context "when build version file" do
    before do
      @repo = Grit::Repo.new(repository_path, :is_bare => true)
      Grit::Repo.should_receive(:new).and_return(@repo)
    end

    context "with only commits" do
      let(:repository_path) { './spec/fixtures/commits_repo/dot_git' }

      it "should be possible to build version file" do
        @builder.run

        File.exists?('./tmp/version.txt').should be_true
      end

      it "should build version file with commits information" do
        @builder.run

        content = read_file

        content.should include("Add README")
        content.should include("Change README")
      end
    end

    context "with tag and commits" do
      let(:repository_path) { './spec/fixtures/tag_repo/dot_git' }

      it "should build version file with tag and commits information" do
        @builder.run

        content = read_file

        content.should include("Version: 0.0.1")
        content.should include("The first commit")
        content.should include("The second commit")
      end
    end

    context "with several tag and commits" do
      let(:repository_path) { './spec/fixtures/tags_repo/dot_git' }

      it "should build version file with the latest tag and commits between tags" do
        @builder.run

        content = read_file

        content.should include("Version: 0.0.2")
        content.should include("Bump gem version to 0.0.2")
        content.should include("Minor changes for version 0.0.2")

        content.should_not include("Version 0.0.1")
        content.should_not include("Bump gem version to 0.0.1")
      end
    end
  end

  def read_file
    File.open("./tmp/#{Versionius::FILE_NAME}").read
  end
end

