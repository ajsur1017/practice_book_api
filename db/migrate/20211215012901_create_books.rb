class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|

      t.timestamps
      t.string :title
      t.string :author
      t.string :genre
      t.string :publisher
      t.date :publish_date
    end
  end
end
