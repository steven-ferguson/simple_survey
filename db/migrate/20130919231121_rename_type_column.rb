class RenameTypeColumn < ActiveRecord::Migration
  def change
    rename_column :responses, :type, :answer_type
  end
end
