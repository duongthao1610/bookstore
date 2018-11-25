require "elasticsearch/model"
class Category < ApplicationRecord
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks
  has_many :books, dependent: :destroy
  settings index: { number_of_shards: 1 } do
    mappings dynamic: 'false' do
      indexes :name, analyzer: 'english', index_options: 'offsets'
      indexes :description, analyzer: 'english'
    end
  end
  class << self
    delegate :search, to: :__elasticsearch__ if self.public_instance_methods.include?(:search)
  end
end
