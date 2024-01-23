class AddFieldsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :status, :string
    add_column :users, :name, :string
    add_column :users, :username, :string
    add_column :users, :verified, :boolean, default: true
  end
end
