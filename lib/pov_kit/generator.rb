require 'erb'
require 'ostruct'

module PovKit
  class Generator
    def camera(*options)

      template_path = File.dirname(__FILE__) + '/templates/camera.erb.inc'
      template = File.read(template_path)
      config = {camera_name: options.first}
      assigns = OpenStruct.new(config)
      p ERB.new(template).result(assigns.instance_eval { binding })
    end

    def macro(*_options)

    end
  end
end