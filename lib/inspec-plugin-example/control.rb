#
# Author:: Matt Ray (<matt@chef.io>)
#
# Copyright:: 2018, Chef Software, Inc <legal@chef.io>
#

module Example
  class Control
    def self.print(options)
      Inspec::Log.debug 'Example::Control debugging message'
      puts "This used to be an example of creating a control, now it's just a subcommand example."
      puts 'I see your example option!' if options[:example]
    end
  end
end
