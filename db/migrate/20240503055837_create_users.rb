class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.text :key
      t.text :name

      t.timestamps
    end
  end
end
