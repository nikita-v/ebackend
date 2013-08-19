class API < Grape::API
  mount Ebashim::ApiV1
end