class AddRatingToBook < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :rating, :integer
  end
end
