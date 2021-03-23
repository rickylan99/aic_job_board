class CreateJobQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :job_questions do |t|
      t.text :question
      t.references :job, null: false, foreign_key: true

      t.timestamps
    end
  end
end
