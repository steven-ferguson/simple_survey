class CreateResponders < ActiveRecord::Migration
  def change
    create_table :responders do |t|
      t.belongs_to :user
      t.belongs_to :survey
      t.timestamps
    end
  end
end
