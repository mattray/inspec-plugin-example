require_relative 'control'
require_relative 'second'
require_relative 'version'

module InspecPlugins::Example
  class CliCommand < Inspec.plugin(2, :cli_command) # Note two-arg form
    subcommand_desc 'example SUBCOMMAND', 'InSpec Example Plugin commands'

    class_option :debug,
                 desc: 'Verbose debugging messages',
                 type: :boolean,
                 default: false

    desc 'version', 'Display version information' # , hide: true
    long_desc <<-LONGDESC
      'version' shows you an example of how to see the version of your plugin

      That's what this is!
    LONGDESC

    def version
      Inspec::Log.level = :debug if options[:debug]
      Inspec::Log.debug 'Example::Version debugging message'
      say("InSpec Example Plugin v#{Example::VERSION}")
    end

    desc 'control', 'Display an example InSpec Control'
    long_desc <<-LONGDESC
      'control' Provides an example of working with InSpec Controls
    LONGDESC

    option :example,
           aliases: '-e',
           desc: 'Example option',
           type: :boolean,
           default: false

    def control
      Inspec::Log.level = :debug if options[:debug]
      Example::Control.print(options)
    end
  end
end

module InspecPlugins::SecondExample
  class CliCommand < Inspec.plugin(2, :cli_command) # Note two-arg form
    subcommand_desc 'example2 SUBCOMMAND', 'Second InSpec Example Plugin commands'

    desc 'second', 'Second InSpec subcommand example'

    def second
      SecondExample::Second.print
    end
  end
end
