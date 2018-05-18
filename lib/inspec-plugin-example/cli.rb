# encoding: utf-8
require "inspec/plugins"
require "thor"
require "inspec-plugin-example/control"

module Example
  class CLI < Thor
    namespace "example"

    map %w{-v --version} => "version"

    desc "version", "Display version information", hide: true
    def version
      say("InSpec Example Plugin v#{Example::VERSION}")
    end

    desc "control", "Display an example InSpec Control"
    def control
      Example::Control.print
    end

  end

  Inspec::Plugins::CLI.add_subcommand(CLI, "example", "example SUBCOMMAND ...", "Example commands", {})
end
