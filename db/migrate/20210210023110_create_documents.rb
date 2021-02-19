class CreateDocuments < ActiveRecord::Migration[6.1]
  def change
    create_table :documents do |t|
      t.integer :userid
      t.string :type
      t.string :image
      t.datetime :dateupdate

      t.timestamps
    end
  end
end
