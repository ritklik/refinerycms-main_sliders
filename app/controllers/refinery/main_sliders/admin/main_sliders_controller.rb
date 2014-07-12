module Refinery
  module MainSliders
    module Admin
      class MainSlidersController < ::Refinery::AdminController

        crudify :'refinery/main_sliders/main_slider',
                :title_attribute => 'name',
                :xhr_paging => true

      end
    end
  end
end
