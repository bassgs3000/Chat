jQuery ->
  $('.chatroom').click( (e) ->
    e.preventDefault()
    ident = $(@).attr('data')
    $.post("/chatroom/set", { identifier: ident })
    .done( (data) ->
      $('#debug').text(ident)
      url = window.location.origin
      pathname = "/messages"
      targetpath = url+pathname
      window.location = targetpath
    )  
  )