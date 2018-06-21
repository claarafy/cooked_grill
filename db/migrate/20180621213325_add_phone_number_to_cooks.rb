class AddPhoneNumberToCooks < ActiveRecord::Migration[5.1]
  def change
    add_column :cooks, :phone_number, :string
  end
end
