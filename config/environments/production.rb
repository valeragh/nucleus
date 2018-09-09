Rails.application.configure do
  config.cache_classes = true
  config.eager_load = true
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true
  config.cache_store = :dalli_store
  config.serve_static_files = ENV['RAILS_SERVE_STATIC_FILES'].present?
  config.assets.js_compressor = :uglifier
  config.assets.compile = false
  config.assets.digest = true
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    :enable_starttls_auto => true,
    :openssl_verify_mode => 'none',
    address:"smtp.locum.ru",
    port: 2525,
    domain: "nucleus.com.ua",
    authentication: "login",
    user_name: Rails.application.secrets.mail_username,
    password: Rails.application.secrets.mail_password
  }
  config.force_ssl = true
  config.log_level = :debug
  config.i18n.fallbacks = true
  config.active_support.deprecation = :notify
  config.log_formatter = ::Logger::Formatter.new
  config.active_record.dump_schema_after_migration = false
  config.action_mailer.default_url_options = { :host => 'nucleus.com.ua' }
  config.action_controller.asset_host = "https://nucleus.com.ua"
  Rails.application.routes.default_url_options[:host] = 'nucleus.com.ua'
  config.active_job.queue_adapter = :sucker_punch
end
