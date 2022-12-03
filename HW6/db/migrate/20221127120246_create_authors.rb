# frozen_string_literal: true

# class CreateAuthors
class CreateAuthors < ActiveRecord::Migration[7.0]
  def change
    create_table :authors, &:timestamps
  end
end
