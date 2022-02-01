class FixColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :items, :completed_ad, :completed_at
  end
end
