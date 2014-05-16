class RemoveFavoritableCommentTable < ActiveRecord::Migration
  def change
    remove_column :comments, :favoritable_idd, :integer
    remove_column :comments, :favoritable_type, :string
  end
end



