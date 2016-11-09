require 'erb'
require 'ostruct'

module PovKit
  class Generator
    def camera (
        is_local,
        name,
        location_x = 0,
        location_y = 0,
        location_z= -10,
        look_at_x = 0,
        look_at_y = 0,
        look_at_z = 0
    )

      assigns = {
          is_local: is_local,
          name: name,
          location: "<#{location_x}, #{location_y}, #{location_z}>",
          look_at: "<#{look_at_x}, #{look_at_y}, #{look_at_z}>",
      }

      render(:camera_default, :camera_local, :camera_global, assigns)
    end

    def material(_scope, *options)
      assigns = {name: options.first}

      #render(:material, assigns)
    end

    def box(_scope, name, x1 = -1, y1 = -1, z1= -1, x2 = 1, y2 = 1, z2 = 1)
      assigns = {
          name: name,
          x1: x1,
          y1: y1,
          z1: z1,
          x2: x2,
          y2: y2,
          z2: z2
      }


      #render(:box, assigns)
    end

    def sphere(_scope, *options)
      assigns = {name: options.first}

      #render(:sphere, assigns)
    end

    def cylinder(_scope, *options)
      assigns = {name: options.first}

      #render(:cylinder, assigns)
    end

    def cone(_scope, *options)
      assigns = {name: options.first}

      #render(:cone, assigns)
    end

    def light_source(_scope, *_options)

    end

    def macro(_scope, *_options)

    end

    private

    def render(default, local, global, assigns)
      template_path = File.dirname(__FILE__) + case
        when assigns[:name] == ''
          "/templates/#{default}.erb"
        when assigns[:is_local]
          "/templates/#{local}.erb"
        else
          "/templates/#{global}.erb"
      end

      template = File.read(template_path)
      ERB.new(template).result(OpenStruct.new(assigns).instance_eval { binding })
    end
  end
end