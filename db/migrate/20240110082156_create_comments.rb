# frozen_string_literal: true

class CreateComments < ActiveRecord::Migration[7.1] # rubocop:disable Style/Documentation
  def change
    create_table :comments do |t|
      t.string :text

      t.timestamps
    end
  end
end
