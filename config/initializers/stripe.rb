Rails.configuration.stripe = {
  :publishable_key => ENV['pk_test_CtjFBG45xz8HzJTmdq90YdFq'],
  :secret_key      => ENV['sk_test_COUfpDRLlSLqouRWoQKZi8Dn']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]