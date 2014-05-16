class MakeCommentsPolymorphic < ActiveRecord::Migration
  def change
    change_table :comments do |t|
      t.remove :video
      t.references :user
      t.integer :favoritable_id
      t.string  :favoritable_type
    end
  end
end


