class CreateMovieMoneyTransfers < ActiveRecord::Migration[5.2]
  def change
    create_table :movie_money_transfers do |t|
      t.references :movie, foreign_key: true
      t.string :budget_type
      t.float :budget_amount
      t.integer :user_id
      t.integer :actor_id
      t.integer :item_id
      t.string :url

      t.timestamps
    end
  end
end
