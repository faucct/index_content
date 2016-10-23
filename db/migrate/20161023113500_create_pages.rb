class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :url, null: false, index: { unique: true }
      t.string :headers1, array: true, null: false, default: '{}'
      t.string :headers2, array: true, null: false, default: '{}'
      t.string :headers3, array: true, null: false, default: '{}'
      t.string :links, array: true, null: false, default: '{}'

      t.timestamps
    end
  end
end
