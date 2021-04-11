class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.string :classification
      t.string :major
      t.integer :document_id
      t.boolean :isAuthorized
      t.boolean :firstLogin
      t.boolean :investment_banking
      t.boolean :private_equity
      t.boolean :venture_capital
      t.boolean :real_estate
      t.boolean :other_prefs
      t.string :other_industrty_preferences
      t.integer :role_id
     

      t.timestamps
    end
  end
end
