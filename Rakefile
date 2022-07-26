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

desc "publish patch version"
task :publish do
  `gem bump patch --push --release`
  `rake changelog`
  `git commit -am 'Changelog update'`
  `git push`
end

desc "publish minor version"
task :publish_minor do
  `gem bump minor --push --release`
  `rake changelog`
  `git commit -am 'Changelog update'`
  `git push`
end

desc "publish minor version"
task :publish_major do
  `gem bump major --push --release`
  `rake changelog`
  `git commit -am 'Changelog update'`
  `git push`
end
