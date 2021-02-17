class CreateCaloriesRegisters < ActiveRecord::Migration[6.1]
  def change
    create_table :calories_registers do |t|
      t.integer :calories
      t.string :description
      t.string :calories_action
      t.date :date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
