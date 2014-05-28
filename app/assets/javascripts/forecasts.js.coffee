# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

window.forecast = () ->
  groups = $('.group-panel')

  for group in groups
    $group = $(group)
    teams = $group.find('table').data().teams
    table = []

    $.each teams, (index, team) ->
      team_data = {team: team, pts: 0, dif: 0}
      sanitized = team.replace(///\ ///g, '.')
      $("input.#{sanitized}").each (index, score) ->
        $score = $(score)
        rival = $score.closest('.row').find("input:not(.#{sanitized})")
        if $score.val() != '' && rival.val() != ''
          result = $score.val() - rival.val()
          team_data['dif'] += result
          $score.parent().removeClass('winner')
          if result > 0
            $score.parent().addClass('winner')
            team_data['pts'] += 3
          else if result == 0
            team_data['pts'] += 1
      table.push(team_data)

    table = table.sort (team1, team2) ->
      diff = team2.pts - team1.pts
      if diff == 0
        team2.dif - team1.dif
      else
        diff

    $.each table, (index, team) ->
      tr = $group.find('table tr')[index+1]
      tds = $(tr).find('td')
      team_html = team.team.titleize()
      if index < 2
        team_html = $('<strong></strong>').text team.team.titleize()

      $(tds[0]).html(team_html)
      $(tds[1]).text(team.pts)
      $(tds[2]).text(team.dif)

