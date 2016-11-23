# Class for generating code for declaring a camera object
module PovKit
  module Generators
    class CameraGenerator < PovKit::Generators::Base
      attr_accessor :name, :location, :look_at

      def configure(options)
        self.asset = :camera
        self.location = vector(*options[:location])
        self.look_at = vector(*options[:look_at])
      end

      def fill_template
        {
            name: self.name,
            location: location,
            look_at: look_at
        }
      end
    end
  end
end
