class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :video
      t.string :content
      t.timestamps
    end
  end
end
