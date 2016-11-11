module PovKit
  module Generators
    class CylinderGenerator < PovKit::Generators::Base
      def initialize(flags:, switches:, args:)
        super(flags: flags, switches: switches, args: args)
        self.asset = :camera
      end

      def fill_template
        {}
      end
    end
  end
end