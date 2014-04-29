class CreateSounds < ActiveRecord::Migration
  def change
    create_table :sounds do |t|
      t.string :title
      t.string :soundclound_url
      t.timestamps
    end
  end
end



