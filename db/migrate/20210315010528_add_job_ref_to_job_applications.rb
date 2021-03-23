class AddJobRefToJobApplications < ActiveRecord::Migration[6.1]
  def change
    add_reference :job_applications, :job, null: false, foreign_key: true
  end
end
