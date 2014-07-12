# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "MainSliders" do
    describe "Admin" do
      describe "main_sliders" do
        refinery_login_with :refinery_user

        describe "main_sliders list" do
          before do
            FactoryGirl.create(:main_slider, :name => "UniqueTitleOne")
            FactoryGirl.create(:main_slider, :name => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.main_sliders_admin_main_sliders_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.main_sliders_admin_main_sliders_path

            click_link "Add New Main Slider"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Name", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::MainSliders::MainSlider.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Name can't be blank")
              Refinery::MainSliders::MainSlider.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:main_slider, :name => "UniqueTitle") }

            it "should fail" do
              visit refinery.main_sliders_admin_main_sliders_path

              click_link "Add New Main Slider"

              fill_in "Name", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::MainSliders::MainSlider.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:main_slider, :name => "A name") }

          it "should succeed" do
            visit refinery.main_sliders_admin_main_sliders_path

            within ".actions" do
              click_link "Edit this main slider"
            end

            fill_in "Name", :with => "A different name"
            click_button "Save"

            page.should have_content("'A different name' was successfully updated.")
            page.should have_no_content("A name")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:main_slider, :name => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.main_sliders_admin_main_sliders_path

            click_link "Remove this main slider forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::MainSliders::MainSlider.count.should == 0
          end
        end

      end
    end
  end
end
