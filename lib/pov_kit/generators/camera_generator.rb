# Class for generating code for declaring a camera object
module PovKit
  module Generators
    class CameraGenerator < PovKit::Generators::Base
      attr_accessor :name, :location, :look_at

      def initialize(flags:, switches:, args:)
        super(flags: flags, switches: switches, args: args)
        self.asset = :camera
        self.location = vector(args[2] || 0, args[3] || 10, args[4] || -10)
        self.look_at = vector(args[5] || 0, args[6] || 10, args[7] || 0)
      end

      def fill_template
        {
            name: name,
            location: location,
            look_at:  look_at
        }
      end
    end
  end
end
