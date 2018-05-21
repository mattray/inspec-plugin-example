# encoding: utf-8
require "inspec/plugins"
require "thor"
require "inspec-plugin-example/control"
require "inspec-plugin-example/second"

module Example
  class CLI < Thor
    namespace "example"

    map %w{-v --version} => "version"

    desc "version", "Display version information", hide: true
    def version
      say("InSpec Example Plugin v#{Example::VERSION}")
    end

    class_option :debug,
      :desc    => "Verbose debugging messages",
      :type    => :boolean,
      :default => false

    desc "control", "Display an example InSpec Control"
    def control
      Inspec::Log.level = :debug if options[:debug]
      Example::Control.print
    end
  end

  Inspec::Plugins::CLI.add_subcommand(CLI, "example", "example SUBCOMMAND ...", "Example commands", {})
end

module SecondExample
  class CLI < Thor
    namespace "example2"

    desc "second", "Second InSpec subcommand example"
    def second
      SecondExample::Second.print
    end
  end

  Inspec::Plugins::CLI.add_subcommand(CLI, "example2", "example2 SUBCOMMAND ...", "Additional Example commands", {})
end
