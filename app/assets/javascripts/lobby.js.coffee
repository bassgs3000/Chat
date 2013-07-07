jQuery ->
  $('.chatroom').click( (e) ->
    e.preventDefault()
    ident = $(@).attr('data')
    $.post("/chatroom/set", { identifier: ident })
    $('#debug').text(ident)
    
    # Begin fake href resumption. This ensures the identifier is posted before changing pages.

    url = window.location.origin
    pathname = "/messages"
    targetpath = url+pathname
    window.location = targetpath
  )