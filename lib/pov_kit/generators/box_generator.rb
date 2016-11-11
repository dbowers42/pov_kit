module PovKit
  module Generators
    class BoxGenerator < PovKit::Generators::Base
      attr_accessor :name, :x1, :y1, :z1, :x2, :y2, :z2

      def initialize(flags:, switches:, args:)
        super(flags: flags, switches: switches, args: args)
        self.asset = :box
        self.x1 = args[1] || -1
        self.y1 = args[2] || -1
        self.z1 = args[3] || -1
        self.x2 = args[4] || 1
        self.y2 = args[5] || 1
        self.z2 = args[6] || 1
      end

      def fill_template
        {
            name: name,
            x1: x1,
            y1: y1,
            z1: z2,
            x2: x2,
            y2: y2,
            z2: z2
        }
      end
    end
  end
end