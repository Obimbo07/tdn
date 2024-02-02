# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[7.1] # rubocop:disable Style/Documentation
  def change
    create_table :users do |t|
      t.string :name
      t.string :photo
      t.string :bio
      t.integer :posts_counter, default: 0

      t.timestamps
    end
  end
end
