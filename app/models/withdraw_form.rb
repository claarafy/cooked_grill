class WithdrawForm < MailForm::Base
  attribute :name,      :validate => true
  attribute :account_email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :paypal_email
  attribute :address
  attribute :amount_in_cents
  attribute :nickname,  :captcha  => true

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      :subject => "You got a Payout Request from CookedNearby.Com.",
      :to => ENV["DEFAULT_TO_EMAIL"],
      :from => %("#{name}" <#{account_email}>)
    }
  end
end
