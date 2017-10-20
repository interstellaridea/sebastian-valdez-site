class CreateResumes < ActiveRecord::Migration[5.1]
  def change
    create_table :resumes do |t|
      t.string :version
      t.text :location

      t.timestamps
    end
  end
end
