#!/usr/bin/env rake
# encoding: utf-8

require "bundler"
require "bundler/gem_tasks"
require "rake/testtask"
require "rubocop/rake_task"

# Rubocop
desc "Run Rubocop lint checks"
task :rubocop do
  RuboCop::RakeTask.new
end

# lint the project
desc "Run robocop linter"
task lint: [:rubocop]

# run tests
task default: [:test, :lint]

Rake::TestTask.new do |t|
  t.libs << "test"
  t.pattern = "test/unit/**/*_test.rb"
  t.warning = true
  t.verbose = true
  t.ruby_opts = ["--dev"] if defined?(JRUBY_VERSION)
end

def ensure_profiles
  dst = "test/functional/profiles"
  return if File.directory? dst
  `git clone git@github.com:chef/inspec-scap-examples.git #{dst}`
end

namespace(:test) do
  Rake::TestTask.new(:functional) do |t|
    ensure_profiles
    t.libs << "test"
    t.pattern = "test/functional/*_test.rb"
    t.warning = true
    t.verbose = true
    t.ruby_opts = ["--dev"] if defined?(JRUBY_VERSION)
  end

  Rake::TestTask.new(:scan) do |t|
    ensure_profiles
    t.libs << "test"
    t.pattern = "test/functional/*_scan.rb"
    t.warning = true
    t.verbose = true
    t.ruby_opts = ["--dev"] if defined?(JRUBY_VERSION)
  end
end

# Print the current version of this gem or update it.
#
# @param [Type] target the new version you want to set, or nil if you only want to show
def version(target = nil)
  path = "lib/inspec-scap/version.rb"
  require_relative path.sub(/.rb$/, "")

  nu_version = target.nil? ? "" : " -> #{target}"
  puts "inspec-scap: #{InspecScap::VERSION}#{nu_version}"

  unless target.nil?
    raw = File.read(path)
    nu = raw.sub(/VERSION.*/, "VERSION = '#{target}'.freeze")
    File.write(path, nu)
    load(path)
  end
end

# Check if a command is available
#
# @param [Type] x the command you are interested in
# @param [Type] msg the message to display if the command is missing
def require_command(x, msg = nil)
  return if system("command -v #{x} || exit 1")
  msg ||= "Please install it first!"
  puts "\033[31;1mCan't find command #{x.inspect}. #{msg}\033[0m"
  exit 1
end

# Check if a required environment variable has been set
#
# @param [String] x the variable you are interested in
# @param [String] msg the message you want to display if the variable is missing
def require_env(x, msg = nil)
  exists = `env | grep "^#{x}="`
  return unless exists.empty?
  puts "\033[31;1mCan't find environment variable #{x.inspect}. #{msg}\033[0m"
  exit 1
end

# Check the requirements for running an update of this repository.
def check_update_requirements
  require_command "git"
  require_command "github_changelog_generator", "\n"\
    "For more information on how to install it see:\n"\
    "  https://github.com/skywinder/github-changelog-generator\n"
  require_env "CHANGELOG_GITHUB_TOKEN", "\n"\
    "Please configure this token to make sure you can run all commands\n"\
    "against GitHub.\n\n"\
    "See github_changelog_generator homepage for more information:\n"\
    "  https://github.com/skywinder/github-changelog-generator\n"
end

# Show the current version of this gem.
desc "Show the version of this gem"
task :version do
  version
end

desc "Generate the changelog"
task :changelog do
  require_relative "lib/inspec-scap/version"
  system "github_changelog_generator -u chef -p inspec-scap --future-release v#{InspecScap::VERSION}"
end

# Update the version of this gem and create an updated
# changelog. It covers everything short of actually releasing
# the gem.
desc "Bump the version of this gem"
task :bump_version, [:version] do |_, args|
  v = args[:version] || ENV["to"]
  raise "You must specify a target version!  rake bump_version to=1.2.3" if v.empty?
  check_update_requirements
  version(v)
  Rake::Task["changelog"].invoke
end
