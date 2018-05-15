# encoding: UTF-8

Team.delete_all
russia = Team.create(name: 'Russia', group: 'A')
saudi_arabia = Team.create(name: 'Saudi Arabia', group: 'A')
egypt = Team.create(name: 'Egypt', group: 'A')
uruguay = Team.create(name: 'Uruguay', group: 'A')

portugal = Team.create(name: 'Portugal', group: 'B')
spain = Team.create(name: 'Spain', group: 'B')
morocco = Team.create(name: 'Morocco', group: 'B')
iran = Team.create(name: 'Iran', group: 'B')

france = Team.create(name: 'France', group: 'C')
australia = Team.create(name: 'Australia', group: 'C')
peru = Team.create(name: 'Peru', group: 'C')
denmark = Team.create(name: 'Denmark', group: 'C')

argentina = Team.create(name: 'Argentina', group: 'D')
iceland = Team.create(name: 'Iceland', group: 'D')
croatia = Team.create(name: 'Croatia', group: 'D')
nigeria = Team.create(name: 'Nigeria', group: 'D')

brazil = Team.create(name: 'Brazil', group: 'E')
switzerland = Team.create(name: 'Switzerland', group: 'E')
costa_rica = Team.create(name: 'Costa Rica', group: 'E')
serbia = Team.create(name: 'Serbia', group: 'E')

germany = Team.create(name: 'Germany', group: 'F')
mexico = Team.create(name: 'Mexico', group: 'F')
sweden = Team.create(name: 'Sweden', group: 'F')
south_korea = Team.create(name: 'South Korea', group: 'F')

belgium = Team.create(name: 'Belgium', group: 'G')
panama = Team.create(name: 'Panama', group: 'G')
tunisia = Team.create(name: 'Tunisia', group: 'G')
england = Team.create(name: 'England', group: 'G')

poland = Team.create(name: 'Poland', group: 'H')
senegal = Team.create(name: 'Senegal', group: 'H')
colombia = Team.create(name: 'Colombia', group: 'H')
japan = Team.create(name: 'Japan', group: 'H')

Match.delete_all
Forecast.delete_all
Match.create(team1_id: russia.id, team2_id: saudi_arabia.id, group: 'A')
Match.create(team1_id: egypt.id, team2_id: uruguay.id, group: 'A')
Match.create(team1_id: russia.id, team2_id: egypt.id, group: 'A')
Match.create(team1_id: uruguay.id, team2_id: saudi_arabia.id, group: 'A')
Match.create(team1_id: uruguay.id, team2_id: russia.id, group: 'A')
Match.create(team1_id: saudi_arabia.id, team2_id: egypt.id, group: 'A')

Match.create(team1_id: morocco.id, team2_id: iran.id, group: 'B')
Match.create(team1_id: portugal.id, team2_id: spain.id, group: 'B')
Match.create(team1_id: portugal.id, team2_id: morocco.id, group: 'B')
Match.create(team1_id: iran.id, team2_id: spain.id, group: 'B')
Match.create(team1_id: iran.id, team2_id: portugal.id, group: 'B')
Match.create(team1_id: spain.id, team2_id: morocco.id, group: 'B')

Match.create(team1_id: france.id, team2_id: australia.id, group: 'C')
Match.create(team1_id: peru.id, team2_id: denmark.id, group: 'C')
Match.create(team1_id: denmark.id, team2_id: australia.id, group: 'C')
Match.create(team1_id: france.id, team2_id: peru.id, group: 'C')
Match.create(team1_id: denmark.id, team2_id: france.id, group: 'C')
Match.create(team1_id: australia.id, team2_id: peru.id, group: 'C')

Match.create(team1_id: argentina.id, team2_id: iceland.id, group: 'D')
Match.create(team1_id: croatia.id, team2_id: nigeria.id, group: 'D')
Match.create(team1_id: argentina.id, team2_id: croatia.id, group: 'D')
Match.create(team1_id: nigeria.id, team2_id: iceland.id, group: 'D')
Match.create(team1_id: nigeria.id, team2_id: argentina.id, group: 'D')
Match.create(team1_id: iceland.id, team2_id: croatia.id, group: 'D')

Match.create(team1_id: costa_rica.id, team2_id: serbia.id, group: 'E')
Match.create(team1_id: brazil.id, team2_id: switzerland.id, group: 'E')
Match.create(team1_id: brazil.id, team2_id: costa_rica.id, group: 'E')
Match.create(team1_id: serbia.id, team2_id: switzerland.id, group: 'E')
Match.create(team1_id: serbia.id, team2_id: brazil.id, group: 'E')
Match.create(team1_id: switzerland.id, team2_id: costa_rica.id, group: 'E')

Match.create(team1_id: germany.id, team2_id: mexico.id, group: 'F')
Match.create(team1_id: sweden.id, team2_id: south_korea.id, group: 'F')
Match.create(team1_id: south_korea.id, team2_id: mexico.id, group: 'F')
Match.create(team1_id: germany.id, team2_id: sweden.id, group: 'F')
Match.create(team1_id: south_korea.id, team2_id: germany.id, group: 'F')
Match.create(team1_id: mexico.id, team2_id: sweden.id, group: 'F')

Match.create(team1_id: belgium.id, team2_id: panama.id, group: 'G')
Match.create(team1_id: tunisia.id, team2_id: england.id, group: 'G')
Match.create(team1_id: belgium.id, team2_id: tunisia.id, group: 'G')
Match.create(team1_id: england.id, team2_id: panama.id, group: 'G')
Match.create(team1_id: england.id, team2_id: belgium.id, group: 'G')
Match.create(team1_id: panama.id, team2_id: tunisia.id, group: 'G')

Match.create(team1_id: colombia.id, team2_id: japan.id, group: 'H')
Match.create(team1_id: poland.id, team2_id: senegal.id, group: 'H')
Match.create(team1_id: japan.id, team2_id: senegal.id, group: 'H')
Match.create(team1_id: poland.id, team2_id: colombia.id, group: 'H')
Match.create(team1_id: japan.id, team2_id: poland.id, group: 'H')
Match.create(team1_id: senegal.id, team2_id: colombia.id, group: 'H')
