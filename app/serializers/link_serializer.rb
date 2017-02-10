class LinkSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :url, :short_url, :random_hex_string, :description
end
