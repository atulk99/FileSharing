class CreateFileUploads < ActiveRecord::Migration[7.1]
  def change
    create_table :file_uploads do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.text :description
      t.string :file_data
      t.string :public_token

      t.timestamps
    end
  end
end
