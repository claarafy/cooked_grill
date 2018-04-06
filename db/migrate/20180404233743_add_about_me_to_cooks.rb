class AddAboutMeToCooks < ActiveRecord::Migration[5.1]
  def change
    add_column :cooks, :about_me, :text
  end
end
