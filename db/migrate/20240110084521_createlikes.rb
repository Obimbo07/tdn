# frozen_string_literal: true

class Createlikes < ActiveRecord::Migration[7.1] # rubocop:disable Style/Documentation
  def change
    create_table :likes, &:timestamps
  end
end
