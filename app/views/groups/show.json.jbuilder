json.extract! @group, :id, :time_frame, :creator_id, :created_at, :updated_at

  json.creator_first_name @group.creator.first_name
  json.creator_last_name @group.creator.last_name

  json.extract!(@group, :created_at)
  json.members @group.users do |user|
    json.user_first_name user.first_name
    json.user_last_name user.last_name
  end