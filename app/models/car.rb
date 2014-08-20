require 'elasticsearch/model'

class Car < ActiveRecord::Base
  
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  belongs_to :user
	has_many :photos, :dependent => :delete_all
	validates :car_make,:car_model,:car_version,:car_year,:car_city,:car_mileage,:car_price,:car_trans,:car_desc,:car_type, presence: true

  scope :used_cars, -> { where(:car_type => "Used") }
  scope :new_cars, -> { where(:car_type => "New") }
  mount_uploader :image, ImageUploader

  def self.search(query)
  __elasticsearch__.search(
      {
       query: {
          multi_match: {
            query: query,
              fields: ['car_*', 'car_make^2', 'car_model^3', 'car_version^4']
          }
        }
      }
    )
  end

  settings index: { number_of_shards: 1 } do
  mappings dynamic: 'false' do
    indexes :car_make, analyzer: 'english'
    indexes :car_model, analyzer: 'english'
    indexes :car_version, analyzer: 'english'
    indexes :car_year, analyzer: 'english'
    indexes :car_city, analyzer: 'english'
    indexes :car_trans, analyzer: 'english'
    indexes :car_desc, analyzer: 'english'
    indexes :car_type, analyzer: 'english'
    end
  end

end

# Delete the previous cars index in Elasticsearch
Car.__elasticsearch__.client.indices.delete index: Car.index_name rescue nil
 
# Create the new index with the new mapping
Car.__elasticsearch__.client.indices.create \
  index: Car.index_name,
  body: { settings: Car.settings.to_hash, mappings: Car.mappings.to_hash }
 
# Index all car records from the DB to Elasticsearch
Car.import