class AddS3ProfileImageToCooks < ActiveRecord::Migration[5.1]
  def change
    add_column :cooks, :s3_profile_image, :string
  end
end
