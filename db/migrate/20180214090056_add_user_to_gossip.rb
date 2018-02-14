class AddUserToGossip < ActiveRecord::Migration[5.1]
  def change
    add_column :gossips, :user, :reference
  end
end
