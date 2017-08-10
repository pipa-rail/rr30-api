class CreateSourceProviders < ActiveRecord::Migration[5.1]
  def change
    create_table :source_providers do |t|
      t.string :name, unique: true, presence: true
      t.string :url,  unique: true, presence: true
      t.string :address, presence: true
      t.boolean :active, default: false
      t.datetime :last_sync_at
      t.timestamps
    end
  end
end
