class CreateLinks < ActiveRecord::Migration[5.0]
  def change
    create_table :links do |t|
      t.integer :user_id
      t.text :url
      t.string :short_url
      t.string :random_hex_string
      t.string :description

      t.timestamps
    end
  end
end
