class AddTitleToMovieMoneyTransfer < ActiveRecord::Migration[5.2]
  def change
    add_column :movie_money_transfers, :title, :string
  end
end
