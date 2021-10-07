class AddUniqNameToEvents < ActiveRecord::Migration[6.1]
  def change
    add_index :events, :name, unique: true
  end
end
