Devise.setup do |config|
  config.mailer_sender = Settings.email

  require "devise/orm/active_record"

  config.authentication_keys = [:login]
  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 11
  config.reconfirmable = true
  config.expire_all_remember_me_on_sign_out = true
  config.password_length = 6..128
  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/
  config.reset_password_within = Settings.reset_password.hours
  config.sign_out_via = :delete
  config.confirm_within = Settings.confirm.days

end
