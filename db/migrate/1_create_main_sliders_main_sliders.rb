class CreateMainSlidersMainSliders < ActiveRecord::Migration

  def up
    create_table :refinery_main_sliders do |t|
      t.string :name
      t.integer :photo_id
      t.text :caption
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-main_sliders"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/main_sliders/main_sliders"})
    end

    drop_table :refinery_main_sliders

  end

end
