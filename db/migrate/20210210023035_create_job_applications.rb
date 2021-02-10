class CreateJobApplications < ActiveRecord::Migration[6.1]
  def change
    create_table :job_applications do |t|
      t.integer :jobid
      t.json :answers
      t.integer :studentid
      t.integer :resumeid

      t.timestamps
    end
  end
end
