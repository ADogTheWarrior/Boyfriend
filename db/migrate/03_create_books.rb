class CreateBooks < ActiveRecord::Migration[4.2]
  def change
    create_table :books do |t|
      t.string :title
      t.integer :pages
      t.integer :author_id
      t.column :genre, :integer

      t.timestamps null: false
    end
  end
end
