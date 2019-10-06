class CreateUsersKeywords < ActiveRecord::Migration[5.2]
  def change
    create_table :users_keywords do |t|
      t.boolean :delete_flg
      t.references :user, foreign_key: true
      t.references :keyword, foreign_key: true

      t.timestamps
    end
  end
end
