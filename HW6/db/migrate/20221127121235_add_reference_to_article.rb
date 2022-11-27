class AddReferenceToArticle < ActiveRecord::Migration[7.0]
  def change
    add_reference :articles, :author, foreign_keys: true
  end
end
