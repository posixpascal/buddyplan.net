require 'sidekiq-status'

rails_root = Rails.root || File.dirname(__FILE__) + '/../..'
rails_env = Rails.env || 'development'

redis_config = {
    host: ENV.fetch("REDIS_HOST", "127.0.0.1"),
    port: ENV.fetch("REDIS_PORT", "6379"),
    db: ENV.fetch("REDIS_DB", 5)
}

Sidekiq.configure_server do |config|
  config.redis = {
      url: "redis://127.0.0.1:6379/1"
  }
  Sidekiq::Status.configure_server_middleware config, expiration: 30.minutes
  Sidekiq::Status.configure_client_middleware config, expiration: 30.minutes
end

Sidekiq.configure_client do |config|
  Sidekiq::Status.configure_client_middleware config, expiration: 30.minutes

  config.redis = {
      url: "redis://127.0.0.1:6379/1"
  }
end


schedule_file = "config/schedule.yml"

if File.exist?(schedule_file) && Sidekiq.server?
  Sidekiq::Cron::Job.load_from_hash YAML.load_file(schedule_file)
end
