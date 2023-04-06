class CreateTestTables < ActiveRecord::Migration[7.0]
  def change
    create_table :test_tables do |t|
      t.text :text_field
      t.integer :num_field
      t.date :date_field

      t.timestamps
    end
  end
end
