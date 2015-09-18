class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :author
      t.datetime :publication_date
      t.string :category
      t.binary :hero_image
      t.string :hero_image_filename
      t.string :hero_image_contenttype
      t.binary :optional_image
      t.string :optional_image_filename
      t.string :optional_image_contenttype
      t.text :content_body

      t.timestamps null: false
    end
  end
end
