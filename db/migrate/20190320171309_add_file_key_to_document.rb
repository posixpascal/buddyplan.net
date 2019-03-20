class AddFileKeyToDocument < ActiveRecord::Migration[5.2]
  def change
    add_column :documents, :file_key, :string
  end
end
