class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.text :description

      t.timestamps
    end

    add_index :books, :id, unique: true
  end
end
