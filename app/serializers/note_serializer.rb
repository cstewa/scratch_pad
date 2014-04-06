class NoteSerializer < ActiveModel::Serializer
  attributes :id, :title, :ordinal, :updated_at
  has_one :body, polymorphic: true
end
