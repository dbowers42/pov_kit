module PovKit
  module Scaffold
    class ProjectScaffold

      def create(target)
        context = {
            target: target,
            pwd: Dir.pwd
        }

        Dir.mkdir(target)
        Dir.mkdir(target + '/pov_kit')

        puts context
      end
    end
  end
end