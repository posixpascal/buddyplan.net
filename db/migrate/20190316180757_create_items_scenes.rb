class CreateItemsScenes < ActiveRecord::Migration[5.2]
  def change
    create_table :items_scenes do |t|
      t.integer :item_id
      t.integer :scene_id

      t.timestamps
    end
  end
end
