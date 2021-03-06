class CreateBudgetIncomes < ActiveRecord::Migration[5.2]
  def change
    create_table :budget_incomes do |t|
      t.references :budget, foreign_key: true
      t.integer :amount
      t.text :reasoning
      t.integer :status

      t.timestamps
    end
  end
end
