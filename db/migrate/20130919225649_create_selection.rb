class CreateSelection < ActiveRecord::Migration
  def change
    create_table :selections do |t|
      t.belongs_to :answer
      t.belongs_to :response
    end
  end
end
