class AddOrdinalToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :ordinal, :integer
  end
end
