class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :created_at, :published
end
