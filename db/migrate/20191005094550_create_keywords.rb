class CreateKeywords < ActiveRecord::Migration[5.2]
  def change
    create_table :keywords do |t|
      t.text :keywords_contents
      t.boolean :delete_flg

      t.timestamps
    end
  end
end
