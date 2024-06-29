class AddImageIdToBooks < ActiveRecord::Migration[6.1]
  def change
     add_column :books, :image_id, :string
  end
end
