class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :user, null: true
      t.references :item, null:true
      t.timestamps
    end
  end
end