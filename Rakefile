# frozen_string_literal: true

require "bundler/gem_tasks"
require "rspec/core/rake_task"
require 'github_changelog_generator/task'

RSpec::Core::RakeTask.new(:spec)

task default: :spec

GitHubChangelogGenerator::RakeTask.new :changelog do |config|
  config.user = 'libis'
  config.project = 'teneo-extensions'
  config.unreleased = false
end

require_relative "lib/teneo/extensions/version"

desc "Bump minor version"
task :bump_minor do
  `gem bump minor`
end


desc "publish new minor version of the gem"
task publish: [:bump_minor, :changelog, :build, :release]
