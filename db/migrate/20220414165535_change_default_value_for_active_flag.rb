class ChangeDefaultValueForActiveFlag < ActiveRecord::Migration[7.0]
  def change
    reversible do |direction|
      direction.up { change_column :customers, :active_flag, :boolean, default: true }
      direction.down { change_column :customers, :active_flag, :boolean, default: nil } 
    end
  end
end
