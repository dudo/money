env = Rails.env.production? ? 'api' : 'tartan'
env = 'tartan' # temporary override while i get production dialed in
Plaid.config do |p|
  p.customer_id = '569d7731a4ce3935462bb615'
  p.secret = '3fe08c95a6d8f636df296e45d25adb'
  p.environment_location = "https://#{env}.plaid.com/"
end

class Plaid::Transaction
  include ActiveModel::Serialization
end