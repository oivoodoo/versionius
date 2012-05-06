require 'spec_helper'
require 'versionomy'

include Versionius

describe Version do
  before do
    @repo = Grit::Repo.new(repository_path, :is_bare => true)
    Grit::Repo.stub!(:new).and_return(@repo)

    version.should_receive(:git_push)
  end

  let(:version) { Version.new(repository_path) }

  context "when we have no tags in the project" do
    let(:repository_path) { './spec/fixtures/commits_repo/dot_git' }

    context "for minor changes" do
      it "should create tag" do
        version.should_receive(:tag_version).with('0.0.1').and_return

        version.minor
      end
    end

    context "for major changes" do
      it "should create tag" do
        version.should_receive(:tag_version).with('0.1.0').and_return

        version.major
      end
    end

    context "for release changes" do
      it "should create tag" do
        version.should_receive(:tag_version).with('1.0.0').and_return

        version.release
      end
    end
  end

  context "when we have minor changes and several tags" do
    let(:repository_path) { './spec/fixtures/tags_repo/dot_git' }

    it "should increment minor version on minor changes" do
      version.should_receive(:tag_version).with('0.0.3').and_return

      version.minor
    end
  end

  context "when we have major changes and several tags" do
    let(:repository_path) { './spec/fixtures/tags_repo/dot_git' }

    it "should increment major version and minor as zero" do
      version.should_receive(:tag_version).with('0.1.0').and_return

      version.major
    end
  end

  context "when we have release changes and several tags" do
    let(:repository_path) { './spec/fixtures/tags_repo/dot_git' }

    it "should increment release version and minor, major as zero" do
      version.should_receive(:tag_version).with('1.0.0').and_return

      version.release
    end
  end
end

