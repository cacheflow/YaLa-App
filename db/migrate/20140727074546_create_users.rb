class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :age
      t.string :country
      t.string :interest
      t.string :language

      t.timestamps
    end
  end
end
