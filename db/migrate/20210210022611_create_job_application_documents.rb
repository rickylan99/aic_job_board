class CreateJobApplicationDocuments < ActiveRecord::Migration[6.1]
  def change
    create_table :job_application_documents do |t|
      t.integer :documentid
      t.integer :applicationid

      t.timestamps
    end
  end
end
