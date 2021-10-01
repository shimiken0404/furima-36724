class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.timestamps

      t.string :title,                null: false
      t.text :comment,                null: false
      t.integer :item_category_id,    null: false
      t.integer :item_show_id,        null: false
      t.integer :delivery_pay_id,     null: false
      t.integer :delivery_address_id, null: false
      t.integer :delivery_day_id,     null: false
      t.integer :pay,                 null: false
      t.references :user,             null: false, foreign_key: true

    end
  end
end

