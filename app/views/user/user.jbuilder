json.name do
  json.first @user.first_name
  json.last @user.last_name
  json.full "#{@user.first_name} #{@user.last_name}"
end
json.email @user.email
json.uid @user.uid
json.provider @user.provider
json.createdAt @user.created_at
json.updatedAt @user.updated_at