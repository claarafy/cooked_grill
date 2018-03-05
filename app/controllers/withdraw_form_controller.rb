class WithdrawFormController < ApplicationController
  def new
    @withdraw_form = WithdrawForm.new
  end

  def create
    @withdraw_form = WithdrawForm.new(params[:withdraw_form])
    @withdraw_form.request = request
    if @withdraw_form.deliver
      flash.now[:notice] = 'Your withdraw request has been submitted.'
    else
      flash.now[:error] = 'Cannot send message.'
      render :new
    end
  end
end
