class Member < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :forecasts
  has_many :member_subscriptions
  has_many :member_groups, through: :member_subscriptions

  def add_points(points)
    self.points ||= 0
    self.points += points
    self.save
  end

  def recalculate_points
    log = Logger.new("#{Rails.root}/log/member_points.log")
    log.info("Recalculating points for #{name} - #{email}")
    update_attributes points: forecasts.includes(:match).map { |f| f.calculate_points }.inject(:+)
    log.info("Done #{name || email} has #{points || 0} points.")
  end

  def full_name
    if name
      "#{name} - #{email}"
    else
      email
    end
  end
end
