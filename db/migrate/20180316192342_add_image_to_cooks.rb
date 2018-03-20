class AddImageToCooks < ActiveRecord::Migration[5.1]
  def change
    add_column :cooks, :profile_image, :string
  end
end
