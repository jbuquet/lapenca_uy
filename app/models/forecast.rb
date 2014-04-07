class Forecast < ActiveRecord::Base
	has_many :results
	belongs_to :member
end