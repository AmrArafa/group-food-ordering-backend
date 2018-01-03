class ChargesController < ApplicationController
require "stripe"	

	def create
  # Amount in cents
  		@amount = 500
  		Stripe.api_key = "sk_test_COUfpDRLlSLqouRWoQKZi8Dn"

		token = params[:stripeToken]

  		charge = Stripe::Charge.create(
  			:source  => token,
    		:amount      => @amount,
    		:description => 'Rails Stripe customer',
    		:currency    => 'EUR'
  			)

		rescue Stripe::CardError => e
  		render json: @amount.errors, status: :unprocessable_entity
	end

	private
	def charge_params
      params.require(:charge).permit(:source)
    end


end
