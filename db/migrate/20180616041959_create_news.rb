class CreateNews < ActiveRecord::Migration[5.1]
  def change
    create_table :news do |t|
      t.string :header, null: false
      t.text :content, null: false

      t.timestamps
    end
  end
end
