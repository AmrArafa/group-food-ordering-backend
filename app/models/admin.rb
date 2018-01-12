require 'digest/sha2'
class Admin < ApplicationRecord
    has_secure_password validations: false
    attr_accessor :password_confirmation
    validates :email, presence: true
    validates :email, uniqueness: true
    validates :email, format: { with: /(?:[a-z0-9!#$%&'*+\/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+\/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])/ }
    validates :password, presence: true, confirmation: true, unless: :skip_validations

  def can_authenticate?(password)
    self.invitation_token.nil? && self.authenticate(password)
  end

  def skip_validations
    self.invitation_token.present?
  end

  def invite!
    payload = "#{Time.now.to_i}.#{Random.new.rand(1000)}.#{Rails.application.secrets.secret_key_base}"
    self.invitation_token = Digest::SHA2.hexdigest(payload)
    self.invited_at = DateTime.now
    if self.save
      InvitationsMailer.admin_invitation(self.email, self.invitation_token).deliver_now
    end
  end

  def accept_invitation!(params)
    params[:invitation_token] = nil
    self.update params
  end
end

