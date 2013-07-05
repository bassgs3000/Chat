jQuery ->
  PrivatePub.subscribe("/messages/new", (data, channel) ->
    $(".messages").append(data.chat_message)
  )
  $(".messages").animate({ scrollTop: $('.messages')[0].scrollHeight}, 1000)
