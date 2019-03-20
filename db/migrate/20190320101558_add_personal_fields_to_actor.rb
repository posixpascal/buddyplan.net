class AddPersonalFieldsToActor < ActiveRecord::Migration[5.2]
  def change
    add_column :actors, :email, :string
    add_column :actors, :street, :string
    add_column :actors, :location, :string
    add_column :actors, :city, :string
    add_column :actors, :postalcode, :string
    add_column :actors, :allergenes, :text
  end
end
