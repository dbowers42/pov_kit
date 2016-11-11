module PovKit
  module Generators
    module GeneratorFactory
      def self.build(asset_type, *options)
        class_name = asset_type.upcase[0] + asset_type[1..-1] + 'Generator'
        klass = Object.const_get("PovKit::Generators::#{class_name}")
        klass.new(*options)
      end
    end
  end
end