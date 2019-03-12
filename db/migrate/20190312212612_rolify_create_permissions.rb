class RolifyCreatePermissions < ActiveRecord::Migration[5.2]
  def change
    create_table(:permissions) do |t|
      t.string :name
      t.references :resource, :polymorphic => true

      t.timestamps
    end

    create_table(:users_permissions, :id => false) do |t|
      t.references :user
      t.references :permission
    end
    
    add_index(:permissions, :name)
    add_index(:permissions, [ :name, :resource_type, :resource_id ])
    add_index(:users_permissions, [ :user_id, :permission_id ])
  end
end
