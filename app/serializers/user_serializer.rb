class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :first_name, :zip,
             :default_delivery_address, :phone_number, :driver_balance, :driver
end
