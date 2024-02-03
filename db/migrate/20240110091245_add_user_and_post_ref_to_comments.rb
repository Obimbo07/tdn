# frozen_string_literal: true

# This class represents a Post in the application
class AddUserAndPostRefToComments < ActiveRecord::Migration[7.1]
  def change
    add_reference :comments, :post, null: false, foreign_key: true
    add_reference :comments, :user, null: false, foreign_key: true
  end
end
