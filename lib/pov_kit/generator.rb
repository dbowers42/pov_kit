require 'erb'
require 'ostruct'

module PovKit
  class Generator
    def camera(*options)
      template = File.read('templates/camera.erb.inc')
      config = {camera_name: options.first}
      assigns = OpenStruct.new(config)
      p ERB.new(template).result(assigns.instance_eval { binding })
    end

    def macro(*_options)

    end
  end
end