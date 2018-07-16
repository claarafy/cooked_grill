module API
  module V1
    class Users < Grape::API
      include API::V1::Defaults

      resource :users do
        desc 'Return all users'
        get '', root: :users do
          return User.all
        end

        desc 'Reset Driver Total to $0.00'
        params do
          requires :id, type: String, desc: 'ID of the user'
        end
        get ':id', root: 'user' do
          byebug
          user = User.where(id: permitted_params[:id]).first!
          user.driver_balance = 0.00 if user.driver_balance
          return user if user.save!
          render json: {
            error: 'Could not reset driver balance',
            status: 400
          }, status: 400
        end
      end
    end
  end
end
