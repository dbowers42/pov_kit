module PovKit
  module Generators
    class MaterialGenerator < PovKit::Generators::Base
      def initialize(flags:, switches:, args:)
        super(flags: flags, switches: switches, args: args)
        self.asset = :material
      end

      def fill_template
        {}
      end
    end
  end
end