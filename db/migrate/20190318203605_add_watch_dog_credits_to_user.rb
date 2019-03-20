class AddWatchDogCreditsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :watchdog_credits, :integer
  end
end
