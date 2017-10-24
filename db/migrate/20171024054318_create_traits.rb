class CreateTraits < ActiveRecord::Migration[5.1]
  def change
    create_table :traits do |t|
      t.references :user, foreign_key: true
      t.text :profile_picture
      t.text :resume

      t.timestamps
    end
  end
end
