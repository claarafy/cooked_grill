class AddFirstNameToCooks < ActiveRecord::Migration[5.1]
  def change
    add_column :cooks, :first_name, :string
  end
end
