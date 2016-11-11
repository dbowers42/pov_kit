module PovKit
  module Generators
    class ConeGenerator < PovKit::Generators::Base
      attr_accessor :v1, :v2, :radius1, :radius2

      def initialize(flags:, switches:, args:)
        super(flags: flags, switches: switches, args: args)
        self.asset = :cone
        self.v1 = vector(args[1], args[2], args[3])
        self.radius1 = args[4]
        self.v2 = vector(args[5], args[6], args[7])
        self.radius2 = args[8]
      end

      def fill_template
        {
            name: name,
            v1: v1,
            v2: v2,
            radius1: radius1,
            radius2: radius2
        }
      end
    end
  end
end