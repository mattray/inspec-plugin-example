#
# Author:: Matt Ray (<matt@chef.io>)
#
# Copyright:: 2018, Chef Software, Inc <legal@chef.io>
#

require "inspec/objects/control"
require "inspec/objects/ruby_helper"
require "inspec/objects/describe"

module Example
  class Control

    def self.print
      # Example of adding a Control
      ctrl = ::Inspec::Control.new
      ctrl.id = "InSpecPluginExample"
      ctrl.title = "Example of an InSpec Control"
      ctrl.desc = "Description of an Example InSpec Control"
      ctrl.impact = "1.0"
      # Example of adding a Resource
      describe = ::Inspec::Describe.new
      # describes the Resource with the id as argument
      describe.qualifier.push(["file", "/tmp/test.txt"])
      # ensure the Resource exists
      describe.add_test(nil, "exist", nil)
      # example of testing a Resource
      describe.add_test("mode", "cmp", "0644")

      ctrl.add_test(describe)

      # print out the Control
      puts "title 'Example File Title'\n\n"
      puts ctrl.to_ruby
    end

  end
end
