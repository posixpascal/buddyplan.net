class AddPhoneNumberToActor < ActiveRecord::Migration[5.2]
  def change
    add_column :actors, :phonenumber, :string
  end
end
