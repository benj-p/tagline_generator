Ruby::OpenAI.configure do |config|
  config.access_token = ENV.fetch('OPEN_AI_SECRET_KEY')
end