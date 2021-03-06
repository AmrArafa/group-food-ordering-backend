class GroupsController < ApplicationController
  before_action :authenticate_request!, :current_user, except: [:show]
  before_action :set_user, only: [:indexUserGroups]
  before_action :set_group, only: [:show, :update, :destroy]

  # GET /groups
  # GET /groups.json
  def index
    @groups = Group.active
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
  

  # POST /groups
  # POST /groups.json
  def create
    @group = @current_user.created_groups.build(group_params)

    if @group.save
      # render :json => @group, :include => [:orders]
      # render :show, status: :created, location: @group
    else
      render json: @group.errors.full_messages, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
    if @group.update(group_params)
      render :show, status: :ok, location: @group
    else
      render json: @group.errors, status: :unprocessable_entity
    end
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
      params.require(:group).permit(:creator_id, :time_frame, orders_attributes: [:paid_online, :will_pay_on_delivery, :paid_on_delivery, :delivered, :user_id, order_items_attributes: [:item_id, :quantity]])
    end
end
