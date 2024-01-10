# frozen_string_literal: true

class CreatePosts < ActiveRecord::Migration[7.1] # rubocop:disable Style/Documentation
  def change
    create_table :posts do |t|
      t.string :title
      t.string :text
      t.integer :comment_counter
      t.integer :like_counter

      t.timestamps
    end
  end
end
