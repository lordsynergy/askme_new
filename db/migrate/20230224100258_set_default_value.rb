class SetDefaultValue < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :navbar_color, :string, default: '#370617'
  end
end
