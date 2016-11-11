# Class for generating code for declaring a camera object
module PovKit
  module Generators
    class CameraGenerator < PovKit::Generators::Base
      attr_accessor :name
      attr_accessor :location_x, :location_y, :location_z
      attr_accessor :look_at_x, :look_at_y, :look_at_z

      def initialize(flags:, switches:, args:)
        super(flags: flags, switches: switches, args: args)
        self.asset = :camera
        self.location_x = args[1] || 0
        self.location_y = args[2] || 0
        self.location_z = args[3] || -10
        self.look_at_x = args[4] || 0
        self.look_at_y = args[5] || 10
        self.look_at_z = args[6] || 0
      end

      def fill_template
        {
            name: name,
            location: "<#{location_x}, #{location_y}, #{location_z}>",
            look_at: "<#{look_at_x}, #{look_at_y}, #{look_at_z}>"
        }
      end
    end
  end
end
