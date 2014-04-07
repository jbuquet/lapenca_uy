class Team < ActiveRecord::Base
  validates :name, presence: true
  validates :coach, presence: true

  has_many :matches
end
