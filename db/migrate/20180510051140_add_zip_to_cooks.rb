class AddZipToCooks < ActiveRecord::Migration[5.1]
  def change
    add_column :cooks, :zip, :string
  end
end
