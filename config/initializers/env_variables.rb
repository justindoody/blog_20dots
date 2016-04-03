REQUIRED_ENV_VARIABLES = [
  'SECRET_KEY'
]
# 'DATABASE_URL'

missing_keys = REQUIRED_ENV_VARIABLES.select do |key|
  ENV[key].blank?
end

raise "Please setup missing environment variables before starting the application: #{missing_keys.join(' ')}" if missing_keys.any?