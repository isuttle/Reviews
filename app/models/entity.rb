class Entity < ActiveRecord::Base
  belongs_to :app
  has_many :reviews
end
