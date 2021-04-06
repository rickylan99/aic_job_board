class AddDocumentRefToJobApplications < ActiveRecord::Migration[6.1]
  def change
    add_reference :job_applications, :document, null: true, foreign_key: true
  end
end
