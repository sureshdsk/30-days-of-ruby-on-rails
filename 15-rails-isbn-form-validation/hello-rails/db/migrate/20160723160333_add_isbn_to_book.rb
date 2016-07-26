class AddIsbnToBook < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :isbn, :string
  end
end
