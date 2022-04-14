class AddDefaultValueAtTrue < ActiveRecord::Migration[7.0]
  def change
    change_column :customers, :active_flag, :boolean, default: true
  end
end
