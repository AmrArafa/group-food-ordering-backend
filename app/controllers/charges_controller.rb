class ChargesController < ApplicationController

	def create

  		@amount = 1000
  		Stripe.api_key = "sk_test_COUfpDRLlSLqouRWoQKZi8Dn"

		token = params[:stripeToken]

  		charge = Stripe::Charge.create(
  			:source  => token,
    		:amount      => @amount,
    		:description => 'Rails Stripe customer',
    		:currency    => 'EGP'
  			)
	end

end
