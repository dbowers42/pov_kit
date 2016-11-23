require 'erb'

# Base class for code generators
module PovKit
  module Generators
    class Base
      attr_accessor :asset, :assigns, :name, :flags, :switches, :scope
      attr_reader :is_local

      def initialize(flags, switches, args)
        options = args.pop
        self.flags = flags
        self.switches = switches
        self.name = (options[:name] || ['']).first
        self.scope = (options[:scope] || [nil]).first
        configure(options)
      end

      def configure(options)
        self.config = options
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

      def vector(x = 0, y = 0, z = 0)
        "<#{x}, #{y}, #{z}>"
      end

      def template_name
        case self.scope
          when 'local'
            'local.erb'
          when 'global'
            'global.erb'
          else
            'default.erb'
        end
      end
    end
  end
end