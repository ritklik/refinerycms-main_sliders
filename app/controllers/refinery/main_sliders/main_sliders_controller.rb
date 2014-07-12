module Refinery
  module MainSliders
    class MainSlidersController < ::ApplicationController

      before_filter :find_all_main_sliders
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @main_slider in the line below:
        present(@page)
      end

      def show
        @main_slider = MainSlider.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @main_slider in the line below:
        present(@page)
      end

    protected

      def find_all_main_sliders
        @main_sliders = MainSlider.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/main_sliders").first
      end

    end
  end
end
