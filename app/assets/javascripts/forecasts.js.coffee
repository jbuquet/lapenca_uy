# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

window.forecast = () ->
  groups = $('.group-panel')

  for group in groups
    $group = $(group)
    teams = $group.find('table').data().teams
    table = []

    $.each teams, (index, team) =>
      @group_name = $group.find('.title').text().split(' ').pop()
      team_data = {team: team, pts: 0, gf: 0, gc: 0}
      sanitized = team.replace(///\ ///g, '.')
      $("input.#{sanitized}.group-stage").each (index, score) ->
        $score = $(score)
        rival = $score.closest('.row').find("input:not(.#{sanitized}.group-stage)")
        if $score.val() != '' && rival.val() != ''
          result = $score.val() - rival.val()
          team_data['gf'] += parseInt($score.val())
          team_data['gc'] += parseInt(rival.val())
          if result > 0
            team_data['pts'] += 3
          else if result == 0
            team_data['pts'] += 1
      table.push(team_data)

    table = table.sort (team1, team2) ->
      diff = team2.pts - team1.pts
      if diff == 0
        gdiff = (team2.gf - team2.gc) - (team1.gf - team1.gc)
        if gdiff == 0
          team2.gf - team1.gf
        else
          gdiff
      else
        diff

    $.each table, (index, team) =>
      tr = $group.find('table tr')[index+1]
      tds = $(tr).find('td')
      team_html = team.team.titleize()
      if index < 2
        team_html = $('<strong></strong>').text team.team.titleize()

      $(tds[0]).html(team_html)
      $(tds[1]).text(team.pts)
      $(tds[2]).text(team.gf)
      $(tds[3]).text(team.gc)
