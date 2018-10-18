# InSpec Plugin Example

This repository provides an example of building a version 2 plugin for use with [InSpec](https://inspec.io). It was built following the instructions from the [Developing InSpec Plugins for the v2 plugin API](https://github.com/inspec/inspec/blob/master/docs/dev/plugins.md) instructions.

# Requirements #

This has been built with Ruby 2.5.1 and InSpec 3.0. It most likely works with InSpec 2.3 and later its versions of Ruby.

# Installation #

`inspec-plugin-example` is a plugin for InSpec and may be installed by following the [Developing InSpec Plugins for the v2 plugin API](https://github.com/inspec/inspec/blob/master/docs/dev/plugins.md#how-plugins-are-located-and-loaded) instructions.

## ~/.inspec/plugins.json

When developing this plugin, this was the contents of my `~/.inspec/plugins.json`

```json
{
    "plugins_config_version" : "1.0.0",
    "plugins": [
        {
            "name": "inspec-plugin-example",
            "installation_type": "path",
            "installation_path": "/Users/mattray/ws/inspec-plugin-example/lib/inspec-plugin-example.rb"
        }
    ]
}
```

# Usage #

    inspec example control

    inspec example help

    inspec example version

    inspec example2 second

# Code Examples #

## lib/inspec-plugin-example.rb ##

Entry point for the plugin code.

## lib/inspec-plugin-example/plugin.rb ##

Declares `example` and `example2` as InSpec subcommands within the `inspec-plugin-example` namespace.

## lib/inspec-plugin-example/cli.rb ##

Defines the `example` and `example2` CliCommands for use with InSpec.

## lib/inspec-plugin-example/control.rb ##

Example of calling another module from a CliCommand used by `inspec example control`

## lib/inspec-plugin-example/second.rb ##

Example of a second CliCommand used by `inspec example2 control`

## lib/inspec-plugin-example/version.rb ##

The version of the plugin may be defined and exposed with `inspec example version`

# Code #

Uses the `.rubocop.yml` from InSpec for code formatting.
