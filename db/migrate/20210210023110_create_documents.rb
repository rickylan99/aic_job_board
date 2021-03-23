class CreateDocuments < ActiveRecord::Migration[6.1]
  def change
    create_table :documents do |t|
      t.string :public_id
      t.string :file_name
      t.string :documenttype
      t.datetime :dateupdate

      t.timestamps
    end
  end
end
