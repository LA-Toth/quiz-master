class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :login
end
