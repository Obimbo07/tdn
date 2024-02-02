# frozen_string_literal: true

class AddUserAndPostRefToComments < ActiveRecord::Migration[7.1] # rubocop:disable Style/Documentation
  def change
    add_reference :comments, :post, null: false, foreign_key: true
    add_reference :comments, :user, null: false, foreign_key: true
  end
end
