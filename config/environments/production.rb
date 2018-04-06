Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # Code is not reloaded between requests.
  config.cache_classes = false

  # Not sure if this is necessary.
  config.assets.precompile += %w( form_datepicker.js )

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports.
  config.consider_all_requests_local = true

  # Allow deliveries
  config.action_mailer.perform_deliveries = true

  # Enable/disable caching. By default caching is disabled.
  if Rails.root.join('tmp/caching-dev.txt').exist?
    config.action_controller.perform_caching = true

    config.cache_store = :memory_store
    config.public_file_server.headers = {
      'Cache-Control' => "public, max-age=#{2.days.seconds.to_i}"
    }
  else
    config.action_controller.perform_caching = false

    config.cache_store = :null_store
  end
  # Setting default URL for Devise mailer
  # config.action_mailer.default_url_options = { host: 'boiling-tor-54337.herokuapp.com'}
  config.action_mailer.default_url_options = { host: 'http://www.CookedNearby.Com/' }

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = true

  config.action_mailer.perform_caching = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Suppress logger output for asset requests.
  config.assets.quiet = true

  # SSL  Baby
  config.force_ssl = true

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true

  # Use an evented file watcher to asynchronously detect changes in source code,
  # routes, locales, etc. This feature depends on the listen gem.
  config.file_watcher = ActiveSupport::EventedFileUpdateChecker

  # SendGrid SETTINGS
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {
    :address              =>  'smtp.sendgrid.net',
    :port                 =>  '587',
    :authentication       =>  :plain,
    :user_name            =>  'app67198103@heroku.com',
    :password             =>  ENV["SENDGRID_PASSWORD"],
    :domain               =>  'heroku.com',
    :enable_starttls_auto  =>  true
  }
end
