class CreateJobApplicationAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :job_application_answers do |t|
      t.text :answer
      t.references :job_application, null: false, foreign_key: true
      t.references :job_question, null: false, foreign_key: true

      t.timestamps
    end
  end
end
