module PovKit
  module Generators
    class BoxGenerator < PovKit::Generators::Base
      attr_accessor :name, :v1, :v2

      def initialize(flags:, switches:, args:)
        super(flags: flags, switches: switches, args: args)
        self.asset = :box
        self.v1 = vector(args[1] || -1, args[2] || -1, args[3] || -1)
        self.v2 = vector(args[4] || 1, args[5] || 1, args[6] || 1)
      end

      def fill_template
        {
            name: name,
            v1: v1,
            v2: v2
        }
      end
    end
  end
end