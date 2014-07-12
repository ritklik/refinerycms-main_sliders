
FactoryGirl.define do
  factory :main_slider, :class => Refinery::MainSliders::MainSlider do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

