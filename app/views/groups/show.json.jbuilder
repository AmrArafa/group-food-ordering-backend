# json.partial! "groups/group", group: @group
# json.group do
  json.creator_first_name @group.creator.first_name
  json.creator_last_name @group.creator.last_name
  # json.by @group.user.username  
  json.extract!(@group, :created_at)
  json.member @group.users do |user|
    json.user_first_name user.first_name
    json.user_last_name user.last_name
  end

# end

# json.array! @group do |group|
#     json.id group.id
#     json.creator_first_name group.creator.first_name
#     json.creator_last_name group.creator.last_name
#     json.time_frame group.time_frame
#     json.created_at group.created_at
#     json.ar

# end
