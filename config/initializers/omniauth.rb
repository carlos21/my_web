Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '467557929946955', 'a180c3126055b645bedbb25c2d840d49'
  provider :twitter, 'CONSUMER_KEY', 'CONSUMER_SECRET'
  provider :github, 'CONSUMER_KEY', 'CONSUMER_SECRET'
end