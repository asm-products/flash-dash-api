class CreateThirdparties < ActiveRecord::Migration
  def change
    create_table :thirdparties do |t|
      t.string :username
      t.string :oauth
      t.references :user
      t.references :service

      t.timestamps
    end
  end
end
