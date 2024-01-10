# frozen_string_literal: true

class AddUserRefToPosts < ActiveRecord::Migration[7.1] # rubocop:disable Style/Documentation
  def change
    add_reference :posts, :author, null: false, foreign_key: { to_table: :users }
  end
end
