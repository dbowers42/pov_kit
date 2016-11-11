module PovKit
  module Generators
    class SphereGenerator < PovKit::Generators::Base
      attr_accessor :center, :radius

      def initialize(flags:, switches:, args:)
        super(flags: flags, switches: switches, args: args)
        self.asset = :sphere
        self.center = vector(args[1], args[2], args[3])
        self.radius = args[4]
      end

      def fill_template
        {
            name: name,
            center: center,
            radius: radius
        }
      end
    end
  end
end
