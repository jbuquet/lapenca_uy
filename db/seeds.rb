# encoding: UTF-8

Team.delete_all
usa = Team.create(name: 'United States', group: 'A')
colombia = Team.create(name: 'Colombia', group: 'A')
costa_rica = Team.create(name: 'Costa Rica', group: 'A')
paraguay = Team.create(name: 'Paraguay', group: 'A')

brazil = Team.create(name: 'Brazil', group: 'B')
ecuador = Team.create(name: 'Ecuador', group: 'B')
haiti = Team.create(name: 'Haiti', group: 'B')
peru = Team.create(name: 'Peru', group: 'B')

mexico = Team.create(name: 'Mexico', group: 'C')
uruguay = Team.create(name: 'Uruguay', group: 'C')
jamaica = Team.create(name: 'Jamaica', group: 'C')
venezuela = Team.create(name: 'Venezuela', group: 'C')

argentina = Team.create(name: 'Argentina', group: 'D')
chile = Team.create(name: 'Chile', group: 'D')
panama = Team.create(name: 'Panama', group: 'D')
bolivia = Team.create(name: 'Bolivia', group: 'D')

Match.delete_all
Forecast.delete_all
Match.create(team1_id: usa.id, team2_id: colombia.id, group: 'A')
Match.create(team1_id: costa_rica.id, team2_id: paraguay.id, group: 'A')
Match.create(team1_id: usa.id, team2_id: costa_rica.id, group: 'A')
Match.create(team1_id: colombia.id, team2_id: paraguay.id, group: 'A')
Match.create(team1_id: usa.id, team2_id: paraguay.id, group: 'A')
Match.create(team1_id: colombia.id, team2_id: costa_rica.id, group: 'A')

Match.create(team1_id: haiti.id, team2_id: peru.id, group: 'B')
Match.create(team1_id: brazil.id, team2_id: ecuador.id, group: 'B')
Match.create(team1_id: brazil.id, team2_id: haiti.id, group: 'B')
Match.create(team1_id: ecuador.id, team2_id: peru.id, group: 'B')
Match.create(team1_id: ecuador.id, team2_id: haiti.id, group: 'B')
Match.create(team1_id: brazil.id, team2_id: peru.id, group: 'B')

Match.create(team1_id: jamaica.id, team2_id: venezuela.id, group: 'C')
Match.create(team1_id: mexico.id, team2_id: uruguay.id, group: 'C')
Match.create(team1_id: uruguay.id, team2_id: venezuela.id, group: 'C')
Match.create(team1_id: mexico.id, team2_id: jamaica.id, group: 'C')
Match.create(team1_id: mexico.id, team2_id: venezuela.id, group: 'C')
Match.create(team1_id: uruguay.id, team2_id: jamaica.id, group: 'C')

Match.create(team1_id: panama.id, team2_id: bolivia.id, group: 'D')
Match.create(team1_id: argentina.id, team2_id: chile.id, group: 'D')
Match.create(team1_id: chile.id, team2_id: bolivia.id, group: 'D')
Match.create(team1_id: argentina.id, team2_id: panama.id, group: 'D')
Match.create(team1_id: chile.id, team2_id: panama.id, group: 'D')
Match.create(team1_id: argentina.id, team2_id: bolivia.id, group: 'D')
