class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :email, null: false, index: { unique: true }
      t.boolean :admin, null: false, default: false

      t.timestamps
    end
  end
end
