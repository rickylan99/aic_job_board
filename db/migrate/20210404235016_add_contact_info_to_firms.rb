class AddContactInfoToFirms < ActiveRecord::Migration[6.1]
  def change
    add_column :firms, :contact_name, :string
    add_column :firms, :contact_email, :string
    add_column :firms, :contact_linkedin, :string
  end
end
