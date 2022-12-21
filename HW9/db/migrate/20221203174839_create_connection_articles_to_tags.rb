# frozen_string_literal: true

# class CreateConnectionArticlesToTags
class CreateConnectionArticlesToTags < ActiveRecord::Migration[7.0]
  def change
    create_table :articles_tags, id: false do |t|
      t.belongs_to :article
      t.belongs_to :tag
    end
  end
end
