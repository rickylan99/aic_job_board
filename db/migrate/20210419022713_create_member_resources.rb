class CreateMemberResources < ActiveRecord::Migration[6.1]
  def change
    create_table :member_resources do |t|
      t.text :title
      t.string :video_url

      t.timestamps
    end
  end
end
