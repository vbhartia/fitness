Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'JiT6PjAl4MTXCSvRm4aFA', '7URkC9GBIU39CbJMkaFnQilq8qA0H4fAFYITFtYkQv4', :display => "popup"
  provider :facebook, FACEBOOK_CONFIG['app_id'], FACEBOOK_CONFIG['secret']
end