class CreateCrawlingSources < ActiveRecord::Migration[5.2]
  def change
    create_table :crawling_sources do |t|
      t.text :source_url
      t.boolean :delete_flg

      t.timestamps
    end
  end
end
