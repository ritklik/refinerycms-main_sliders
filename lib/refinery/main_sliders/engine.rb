module Refinery
  module MainSliders
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::MainSliders

      engine_name :refinery_main_sliders

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "main_sliders"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.main_sliders_admin_main_sliders_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/main_sliders/main_slider',
            :title => 'name'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::MainSliders)
      end
    end
  end
end
