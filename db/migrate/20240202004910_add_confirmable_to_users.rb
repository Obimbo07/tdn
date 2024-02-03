# frozen_string_literal: true

# This class represents a Post in the application
class AddConfirmableToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :confirmed_at, :datetime
  end
end
