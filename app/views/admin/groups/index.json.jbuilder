# json.array! @groups, partial: 'groups/group', as: :group
# json.array!(@groups, :id, :order_id, :item_id, :quantity, :created_at, :updated_at)
json.array! @groups do |group|
    json.id group.id
    json.creator_first_name group.creator.first_name
    json.creator_last_name group.creator.last_name
    json.time_frame group.time_frame
    json.created_at group.created_at
    # json.users group.users
    json.member group.users do |user|
        json.first_name user.first_name
        json.last_name user.last_name
    end

end
