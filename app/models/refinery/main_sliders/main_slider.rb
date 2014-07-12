module Refinery
  module MainSliders
    class MainSlider < Refinery::Core::BaseModel
      self.table_name = 'refinery_main_sliders'

      attr_accessible :name, :photo_id, :caption, :position

      validates :name, :presence => true, :uniqueness => true

      belongs_to :photo, :class_name => '::Refinery::Image'
    end
  end
end
