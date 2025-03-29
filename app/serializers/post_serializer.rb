class PostSerializer < ActiveModel::Serializer
  attributes :title, :content, :created_at, :published

  belongs_to :user

  def serializable_hash(adapter_options = nil, options = {}, adapter_instance = self.class.serialization_adapter_instance)
    hash = super
    hash.except(:id) # remove :id from the top-level hash
  end
end
