class CreateJobApplications < ActiveRecord::Migration[6.1]
  def change
    create_table :job_applications do |t|
      t.integer :jobid
      t.string :answers
      t.integer :userid

      t.timestamps
    end
  end
end
