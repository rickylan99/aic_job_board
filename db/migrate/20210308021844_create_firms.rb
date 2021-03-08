class CreateFirms < ActiveRecord::Migration[6.1]
  def change
    create_table :firms do |t|
      t.string :name
      t.text :description
      t.string :logo
      t.string :location
      t.string :industry
      t.string :website
      t.string :linkedin

      t.timestamps
    end
  end
end
