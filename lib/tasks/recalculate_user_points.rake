namespace :lapencauy do
  desc 'Recalculate user points'
  task recalculate: :environment do
    Member.includes(:forecasts).each do |member|
      member.recalculate_points
    end
  end
end

