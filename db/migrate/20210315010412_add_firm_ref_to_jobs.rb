class AddFirmRefToJobs < ActiveRecord::Migration[6.1]
  def change
    add_reference :jobs, :firm, null: false, foreign_key: true
  end
end
