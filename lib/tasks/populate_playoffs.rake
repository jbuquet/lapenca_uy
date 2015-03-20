namespace :lapencauy do
  desc 'Populate playoffs'
  task :populate_playoffs, [:FA, :FB, :FC, :FD, :FE, :FF, :FG, :FH, :SA, :SB, :SC, :SD, :SE, :SF, :SG, :SH] => :environment do |task, args|
    match = Match.where(stage: 16, pos_in_stage: 1).first
    match.team1_id = Team.where(name: args[:FA]).first.id
    match.team2_id = Team.where(name: args[:SB]).first.id
    match.save

    match = Match.where(stage: 16, pos_in_stage: 2).first
    match.team1_id = Team.where(name: args[:FC]).first.id
    match.team2_id = Team.where(name: args[:SD]).first.id
    match.save

    match = Match.where(stage: 16, pos_in_stage: 5).first
    match.team1_id = Team.where(name: args[:FE]).first.id
    match.team2_id = Team.where(name: args[:SF]).first.id
    match.save

    match = Match.where(stage: 16, pos_in_stage: 6).first
    match.team1_id = Team.where(name: args[:FG]).first.id
    match.team2_id = Team.where(name: args[:SH]).first.id
    match.save



    match = Match.where(stage: 16, pos_in_stage: 3).first
    match.team1_id = Team.where(name: args[:FB]).first.id
    match.team2_id = Team.where(name: args[:SA]).first.id
    match.save

    match = Match.where(stage: 16, pos_in_stage: 4).first
    match.team1_id = Team.where(name: args[:FD]).first.id
    match.team2_id = Team.where(name: args[:SC]).first.id
    match.save

    match = Match.where(stage: 16, pos_in_stage: 7).first
    match.team1_id = Team.where(name: args[:FF]).first.id
    match.team2_id = Team.where(name: args[:SE]).first.id
    match.save

    match = Match.where(stage: 16, pos_in_stage: 8).first
    match.team1_id = Team.where(name: args[:FH]).first.id
    match.team2_id = Team.where(name: args[:SG]).first.id
    match.save
  end
end