# frozen_string_literal: true

# This migration adds a role to the users table
class AddRoleToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :role, :string
  end
end
