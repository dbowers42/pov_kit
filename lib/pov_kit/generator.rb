require 'erb'
require 'ostruct'

module PovKit
  class Generator
    def camera(*options)
      assigns = {name: options.first}

      p render(:camera, assigns)
    end

    def material(*options)
      assigns = {name: options.first}

      p render(:material, assigns)
    end

    def light_source(*_options)

    end

    def macro(*_options)

    end

    private

    def render(asset, assigns)
      template_path = File.dirname(__FILE__) + "/templates/#{asset}.erb.inc"
      template = File.read(template_path)
      ERB.new(template).result(OpenStruct.new(assigns).instance_eval { binding })
    end
  end
end