class CreateQuoters < ActiveRecord::Migration
  def change
    create_table :quoters do |t|
      t.string :name
      t.string :rss_url

      t.timestamps
    end
  end
end
