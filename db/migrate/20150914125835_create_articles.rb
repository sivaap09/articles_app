class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :author
      t.date :publication_date
      t.string :category
      t.binary :hero_image
      t.binary :optional_image
      t.text :content_body

      t.timestamps null: false
    end
  end
end
