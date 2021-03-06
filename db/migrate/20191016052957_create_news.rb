# frozen_string_literal: true

class CreateNews < ActiveRecord::Migration[5.2]
  def change
    create_table :news do |t|
      t.string :title
      t.text :content
      t.string :img_src
      t.string :url
      t.datetime :delivery_date
      t.boolean :delete_flg
      t.references :keyword, foreign_key: true

      t.timestamps
    end
  end
end
