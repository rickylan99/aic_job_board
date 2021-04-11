class AddExpiredToJobs < ActiveRecord::Migration[6.1]
  def change
    add_column :jobs, :expired, :boolean
  end
end
