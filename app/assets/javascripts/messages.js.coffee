jQuery ->
  $(".messages").animate({ scrollTop: $('.messages')[0].scrollHeight}, 1000)

  $('#invite').click( (e) ->
    e.preventDefault()
    $('#invitequery').toggle()

    $('#invitequery input').keypress( (e) ->
      username = $(this).val()
      if e.which == 13
        $.post("/messages/invite", { invite: username })
        $('#invitequery input').val("")
        $('#invitequery').hide()
    )
  )

