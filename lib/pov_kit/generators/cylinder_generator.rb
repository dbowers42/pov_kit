module PovKit
  module Generators
    class CylinderGenerator < PovKit::Generators::Base
      def initialize(flags:, switches:, args:)
        super(flags: flags, switches: switches, args: args)
        self.asset = :cylinder
        self.v1 = vector(args[1], args[2], args[3])
        self.v2 = vector(args[4], args[5], args[6])
        self.radius = args[7]
      end

      def fill_template
        {
            name: name,
            v1: v1,
            v2: v2,
            radius: radius
        }
      end
    end
  end
end