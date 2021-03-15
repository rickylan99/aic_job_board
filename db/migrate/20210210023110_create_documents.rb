class CreateDocuments < ActiveRecord::Migration[6.1]
  def change
    create_table :documents do |t|
      t.string :file
      t.string :type
      t.date :date_uploaded

      t.timestamps
    end
  end
end
