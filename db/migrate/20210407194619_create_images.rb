class CreateImages < ActiveRecord::Migration[6.1]
  def change
    create_table :images do |t|
      t.integer :firm_id
      t.binary :file
      t.string :filename
      t.string :mime_type

      t.timestamps
    end
  end
end
