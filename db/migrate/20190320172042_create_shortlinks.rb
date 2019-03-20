class CreateShortlinks < ActiveRecord::Migration[5.2]
  def change
    create_table :shortlinks do |t|
      t.string :key
      t.string :target

      t.timestamps
    end
  end
end
