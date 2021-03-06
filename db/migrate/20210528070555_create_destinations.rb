class CreateDestinations < ActiveRecord::Migration[6.0]
  def change
    create_table :destinations do |t|
      t.string       :postal_code,     null: false
      t.integer      :prefectures_id,  null: false
      t.string       :municipality,    null: false
      t.string       :adress,          null: false
      t.string       :building
      t.string       :phone_number,    null: false
      t.references   :order,           null: false,   foreign_key: true
      t.timestamps
    end
  end
end
