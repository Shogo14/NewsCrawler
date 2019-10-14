class CreateUsersKeywords < ActiveRecord::Migration[5.2]
  def change
    create_table :users_keywords do |t|
      t.integer :user_id
      t.integer :keyword_id
      t.boolean :delete_flg, default: false

      t.timestamps
    end
  end
end
