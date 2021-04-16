class CreateExports < ActiveRecord::Migration[6.1]
  def change
    create_table :exports do |t|
      t.integer :total_actions
      t.integer :progress
      t.integer :user_id

      t.timestamps
    end
  end
end
