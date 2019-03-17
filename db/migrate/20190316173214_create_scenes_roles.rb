class CreateScenesRoles < ActiveRecord::Migration[5.2]
  def change
    create_table :roles_scenes do |t|
      t.belongs_to :role, index: true
      t.belongs_to :scene, index: true
      t.timestamps
    end
  end
end
