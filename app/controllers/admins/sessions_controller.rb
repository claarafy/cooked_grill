# TODO: Not used!
class Admins::SessionsController < Devise::SessionsController
  skip_before_action :verify_authenticity_token

  # TODO: Review?!
  def destroy
    raise 'hi'
  end
end
