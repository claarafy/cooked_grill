class ChangeColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :meals, :availibility_from, :availability_from
  end
end
