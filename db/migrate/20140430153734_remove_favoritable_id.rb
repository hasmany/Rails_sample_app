class RemoveFavoritableId < ActiveRecord::Migration
  def change
    remove_column :comments, :favoritable_id, :integer
  end
end
