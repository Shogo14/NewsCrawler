class CreateNewsKeywords < ActiveRecord::Migration[5.2]
  def change
    create_table :news_keywords do |t|
      t.boolean :delete_flg, default: false
      t.references :keyword, foreign_key: true
      t.references :news, foreign_key: true

      t.timestamps
    end
  end
end
