class CreateJoinTableDocumentJobApplication < ActiveRecord::Migration[6.1]
  def change
    create_join_table :documents, :job_applications do |t|
      # t.index [:document_id, :job_application_id]
      # t.index [:job_application_id, :document_id]
    end
  end
end
