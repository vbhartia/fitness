Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'JiT6PjAl4MTXCSvRm4aFA', '7URkC9GBIU39CbJMkaFnQilq8qA0H4fAFYITFtYkQv4', :display => "popup"
  provider :facebook, '587388351349075', 'a276eddaad650f8f5d763217a883e4d8'
end