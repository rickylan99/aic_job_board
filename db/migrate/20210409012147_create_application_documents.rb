class CreateApplicationDocuments < ActiveRecord::Migration[6.1]
  def change
    create_table :application_documents do |t|
      t.string :public_id
      t.string :documenttype
      t.string :file_name
      t.integer :job_application_id

      t.timestamps
    end
  end
end
