class Genre < ActiveRecord::Base
  has_many :films
  validates :name, presence: true
  validates_presence_of :name
end
