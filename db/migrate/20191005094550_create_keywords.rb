class CreateKeywords < ActiveRecord::Migration[5.2]
  def change
    create_table :keywords do |t|
      t.text :keywords_contents
      t.boolean :delete_flg, default: false

      t.timestamps
    end
  end
end
