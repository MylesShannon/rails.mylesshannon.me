class UserSerializer < ActiveModel::Serializer
  self.root = false

  attributes :id, :displayName, :email, :image

  def displayName
    object.display_name
  end
end
