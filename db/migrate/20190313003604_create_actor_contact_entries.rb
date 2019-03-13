class CreateActorContactEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :actor_contact_entries do |t|
      t.string :firstname
      t.string :lastname
      t.string :phonenumber
      t.string :email
      t.text :allergenes
      t.string :street
      t.string :location
      t.string :postalcode
      t.string :dob

      t.timestamps
    end
  end
end
