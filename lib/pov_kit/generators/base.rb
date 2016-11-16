require 'erb'

# Base class for code generators
module PovKit
  module Generators
    class Base
      attr_accessor :asset, :assigns, :name
      attr_reader :is_local

      def initialize(flags:, switches:, args:)
        @name = args[1]
        # TODO: Fix, code is flawed just because something is not local does not mean it is global
        @is_local = @name && !!switches[:local] unless !!switches[:global]
      end

      def fill_template
        {}
      end

      def template_path
        unless @template_path
          @template_path = "#{File.dirname(__FILE__)}/templates/#{asset}/#{template_name}"
        end

        @template_path
      end

      def render
        template = File.read(template_path)

        ERB.new(template)
           .result(OpenStruct.new(fill_template)
           .instance_eval { binding })
      end

      def vector(x, y, z)
        "<#{x || 0}, #{y || 0}, #{z || 1}>"
      end

      def template_name
        case
          when @name == ''
            'default.erb'
          when @is_local
            'local.erb'
          else
            'global.erb'
        end
      end
    end
  end
end