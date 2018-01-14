class Admin::InvitationsMailer < ApplicationMailer
    
    def admin_invitation(email, invitation_token)
    @token = invitation_token

    mail from: 'ahmedelanadoly@gmail.com', to: email, subject: 'Welcome to AlMakinah Resturant'
  end
end
