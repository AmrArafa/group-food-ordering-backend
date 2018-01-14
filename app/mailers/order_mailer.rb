class OrderMailer < ApplicationMailer
  default from: 'ahmedelanadoly@gmail.com'

  def order_confirmation(email, first_name)
    @first_name = first_name
    mail to: email, subject: 'Your order is confirmed'
  end
end
