class Forecast < ActiveRecord::Base
  belongs_to :member
  belongs_to :match
end
