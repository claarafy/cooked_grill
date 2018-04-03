# TODO Not used!
class Admins::SessionsController < Devise::SessionsController
  skip_before_action :verify_authenticity_token

  def destroy
    raise "hi"
  end
end
