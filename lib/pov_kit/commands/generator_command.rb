include GLI::App

desc 'Generates a project asset'
arg_name 'asset'
command :generate do |c|
  c.desc 'Generates a camera'
  
  c.arg 'location', :optional
  c.arg 'location_x', :optional
  c.arg 'location_y', :optional
  c.arg 'location_z', :optional
  c.arg 'look_at', :optional
  c.arg 'look_at_x', :optional
  c.arg 'look_at_y', :optional
  c.arg 'look_at_z', :optional
  c.arg 'name', :optional
  c.arg 'name_value', :optional
  c.arg 'scope', :optional
  c.arg 'scope_value', :optional
  c.flag [:l, :local]
  c.command :camera do |camera|
    camera.action do |flags, switches, args|
    puts PovKit::Generators::CameraGenerator.new(flags, switches, args).render
    end
  end

  c.desc 'Generates a box'
  c.command :box do |box|
    box.action do |_global_options, _options, _args|

    end
  end

  c.desc 'Generates a sphere'
  c.command :sphere do |sphere|
    sphere.action do |_global_options, _options, _args|

    end
  end
end
