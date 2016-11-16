module PovKit
  module Generators
    class ConfigGenerator < PovKit::Generators::Base
      attr_accessor :project_name

      def initialize(flags:, switches:, args:)
        super(flags: flags, switches: switches, args: args)
        self.asset = :config
        self.project_name = args[1]
      end

      def fill_template
        {
            project_name: project_name
        }
      end

      def template_name
        'default.erb'
      end
    end
  end
end
