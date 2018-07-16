module API
  module V1
    class Orders < Grape::API
      include API::V1::Defaults

      resource :orders do
        desc 'Return all orders'
        get '', root: :orders do
          Order.all
        end

        desc 'Return an Order'
        params do
          requires :id, type: String, desc: 'ID of the order'
        end
        get ':id', root: 'order' do
          return Order.where(id: permitted_params[:id]).first!
        end

        desc 'Reset Driver Total to $0.00'
        params do
          requires :id, type: String, desc: 'ID of the user'
        end
        get ':id', root: 'user' do
          user = User.where(id: permitted_params[:id]).first!
          user.driver_balance = 0.00 if user.driver_balance
          return user if user.save!
          render json: {
            error: 'Could not reset driver balance',
            status: 400
          }, status: 400
        end

        desc 'Mark Order Delivered'
        params do
          requires :id, type: String, desc: 'ID of the order'
          requires :delivered, type: Boolean, desc: 'Boolean value'
        end
        get ':id/:delivered', root: 'order' do
          @order = Order.where(id: permitted_params[:id]).first!
          # Update order and driver total if applicable
          if :delivered
            @order.delivered = true
            @order.review = Review.new unless @order.review
            # @order.driver = User.new unless @order.driver
            # Add delivery time stamp
            # TODO handle better
            raise 'Problem updating order, please notify admin.' unless @order.save!
            # Update driver total
            # TODO Hardcoded driver balance. Change later.
            @driver = @order.driver
            if @driver.driver_balance
              @driver.driver_balance += @order.delivery_fee
            else
              @driver.driver_balance = @order.delivery_fee
            end
            @driver.save!
          end
          @order
          # Order.where(id: permitted_params[:id]).first!
        end

        # desc 'Return an order'
        # params do
        #   requires :id, type: String, desc: "ID of the
        #     order"
        # end
        # get '', root: :orders do
        #   byebug
        #   Order.where(id: permitted_params[:id]).first!
        # end

        # desc 'Return a specific order'
        # route_param :id do
        #   get do
        #     order = Order.find(params[:id])
        #     present order
        #   end
        # end
        #
      end
    end
  end
end
