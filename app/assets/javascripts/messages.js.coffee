jQuery ->
  $(".messages").animate({ scrollTop: $('.messages')[0].scrollHeight}, 1000)

  $('#invite').click( (e) ->
    e.preventDefault()
    $('#invitequery').show()
  )

