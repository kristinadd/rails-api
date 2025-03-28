class PostSerializer < ActiveModel::Serializer
  # no need to include id, it' handled automatically by ActiveModel::Serializer
  # and it will be included in the JSON response
  # by default
  
  attributes :title, :content, :created_at, :published

  belongs_to :user
end
