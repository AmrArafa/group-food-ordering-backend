class NotificationsController < ApplicationController

  def index
  	 @notifications = if params[:user_id].present?
                Notification.of_user(params[:user_id]).reverse
              else
                Notification.all.reverse
              end	
     render json: @notifications         
  end

  private

    def notification_params
      params.require(:notification).permit(:user_id, :recipient_id, :action, :notifiable_type, :notifiable_id)
    end
end
