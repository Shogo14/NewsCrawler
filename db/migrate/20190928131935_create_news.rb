class CreateNews < ActiveRecord::Migration[5.2]
  def change
    create_table :news do |t|
      t.string :title
      t.string :contents
      t.string :img_src
      t.string :url
      t.date :delivery_date
      t.boolean :delete_flg

      t.timestamps
    end
  end
end
