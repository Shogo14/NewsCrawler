# frozen_string_literal: true

class CreateKeywords < ActiveRecord::Migration[5.2]
  def change
    create_table :keywords do |t|
      t.text :name
      t.boolean :delete_flg, default: false

      t.timestamps
    end
  end
end
