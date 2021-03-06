class Admin::GroupsController < ApplicationController
  before_action :admin_authenticate_request!
  before_action :set_user, only: [:indexUserGroups]
  before_action :set_group, only: [:show, :update, :destroy]

  # GET /groups
  # GET /groups.json
  def index
    @groups = Group.all
    # render json: @groups.as_json(include: :users, include: :creator)
  end
  def indexUserGroups
    @groups = @user.created_groups 
  end
  # GET /groups/1
  # GET /groups/1.json
  def show
    @group
  end
  

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group.destroy
  end

  private
    def set_user
      @user = User.find(params[:creator_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_params
      params.require(:group).permit(:creator_id, :time_frame)
    end
end
