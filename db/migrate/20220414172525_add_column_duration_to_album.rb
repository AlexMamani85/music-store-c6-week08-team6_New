class AddColumnDurationToAlbum < ActiveRecord::Migration[7.0]
  def change
    add_column :albums, :duration, :integer
  end
end