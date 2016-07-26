class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :commenter
      t.text :message
      t.references :book, foreign_key: true

      t.timestamps
    end
  end
end
