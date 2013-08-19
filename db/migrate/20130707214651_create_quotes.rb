class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.belongs_to :quoter, index: true
      t.string :title
      t.text :body
      t.datetime :publicated_at

      t.timestamps
    end
    
    add_index :quotes, :publicated_at
  end
end
