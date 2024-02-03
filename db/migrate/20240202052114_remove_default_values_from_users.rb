# frozen_string_literal: true

class RemoveDefaultValuesFromUsers < ActiveRecord::Migration[7.1]
  def change
    change_column_default :users, :email, nil
    change_column_default :users, :encrypted_password, nil
  end
end
