class CreateUserPreferences < ActiveRecord::Migration
  def change
    create_table :user_preferences do |t|
      t.string :bg_color
      t.references :user

      t.timestamps
    end
  end
end
