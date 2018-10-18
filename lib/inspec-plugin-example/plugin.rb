# Plugin Definition file
# The purpose of this file is to declare to InSpec what plugin_types (capabilities)
# are included in this plugin, and provide hooks that will load them as needed.

# It is important that this file load successfully and *quickly*.
# Your plugin's functionality may never be used on this InSpec run; so we keep things
# fast and light by only loading heavy things when they are needed.

require 'inspec/plugin/v2'

# The InspecPlugins namespace is where all plugins should declare themselves.
# The 'Inspec' capitalization is used throughout the InSpec source code; yes, it's
# strange.

module InspecPlugins
  # Pick a reasonable namespace here for your plugin.  A reasonable choice
  # would be the CamelCase version of your plugin gem name.
  module Example
    class Plugin < ::Inspec.plugin(2)
      # Internal machine name of the plugin. InSpec will use this in errors, etc.
      plugin_name :'inspec-plugin-example'

      cli_command :example do
        # Calling this hook doesn't mean example is being executed - just
        # that we should be ready to do so. So, load the file that defines the
        # functionality.
        # For example, InSpec will activate this hook when `inspec help` is
        # executed, so that this plugin's usage message will be included in the help.
        require_relative 'cli'

        # Having loaded our functionality, return a class that will let the
        # CLI engine tap into it.
        InspecPlugins::Example::CliCommand
      end

      cli_command :example2 do
        require_relative 'cli'
        InspecPlugins::SecondExample::CliCommand
      end
    end
  end
end
