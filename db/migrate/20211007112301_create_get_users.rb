class CreateGetUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :get_users do |t|

      t.string :postal_code,             null: false
      t.integer :delivery_address_id,    null: false
      t.string :address_city,            null: false
      t.string :address_number,          null: false
      t.string :telephone_number,        null: false
      t.references :buy_item,            null: false, foreign_key: true

      t.string :address_building

      t.timestamps
    end
  end
end
