# InSpec Plugin Example

This repository provides an example of building a plugin for use with [InSpec](https://inspec.io).

# Requirements #

This has been built with Ruby 2.4.4 and InSpec 2.0. It most likely works with InSpec 1.5.x and its versions of Ruby.

# Installation #

`inspec-plugin-example` is a plugin for InSpec and may be installed as follows

```bash
# install InSpec
gem install inspec
```

Then install the `inspec-plugin-example` plugin via `~/.inspec/plugins` or a gem build:

bundler?

## * for development: ##

```bash
# Install `inspec-plugin-example` via a symlink:
git clone git@github.com:inspec/inspec-plugin-example ~/inspec-plugin-example
mkdir -p ~/.inspec/plugins
ln -s ~/inspec-plugin-example/ ~/.inspec/plugins/inspec-plugin-example
inspec example help
```

## * or build a gem: ##

```bash
# Build the `inspec-plugin-example` then install:
git clone https://github.com/inspec/inspec-plugin-example && cd inspec-plugin-example && gem build *gemspec && gem install *gem
inspec example help
```

# Usage #

    inspec example help

    inspec example control

    inspec example version

# Code Examples #

## lib/example.rb ##

## lib/example/cli.rb ##

InSpec uses [Thor](http://whatisthor.com/) for adding command-line options. This shows how to add Thor subcommands for use with InSpec.

## lib/example/control.rb ##

This shows how to use InSpec objects for building and printing Controls.

## lib/example/version.rb ##

The version of the plugin may be defined and exposed with ```inspec example version```

## tests/ ##

Add some test examples

# Testing #

chefstyle

document Rakefile usage

how does the CHANGELOG generator work?

```
# all tests
bundle exec rake test

# single test
bundle exec ruby -W -Ilib:test test/unit/oval/registry/family_test.rb
```
