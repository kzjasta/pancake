jQuery ->
  $('#touch_player_id').hide()
  players = $('#touch_player_id').html()
  $('#touch_team_id').change ->
    team = $('#touch_team_id :selected').text()
    options = $(players).filter("optgroup[label='#{team}']").html()
    if options
      $('#touch_player_id').show()
      $('#touch_player_id').html(options)
    else
      $('#touch_player_id').empty()
      $('#touch_player_id').hide()


