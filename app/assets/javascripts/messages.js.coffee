# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

currentids = []

@MessagePoller =
  initialRequest: ->
    format = 'json'
    $.getJSON( $('.messages').data('url')+'.'+ format, (results) ->
      for result in results
        id = result["id"]
        currentids.push(id)
    )

  poll: ->
    setInterval @request, 5000

  request: ->
    format = 'json'
    $.getJSON( $('.messages').data('url')+'.'+ format, (results) ->
      MessagePoller.addMessages(results)
    )

  addMessages: (results) ->
    for result in results
      id = result["id"]
      if $.inArray(id,currentids) is -1
        currentids.push(id)
        message = '<div class="message">' + result["username"] + ": " + result["content"] + "</div>"
        $('.messages').append(message)

  submit: ->
    $('form#new_message').submit()
    $('form#new_message')[0].reset()
    $(".messages").animate({ scrollTop: $('.messages')[0].scrollHeight}, 1000)
    MessagePoller.request()
    return false



jQuery ->
  #alert "DOM is loaded" Sanity check
  MessagePoller.initialRequest()
  MessagePoller.poll()
  $('#message_content').keypress((e) ->
    if e.which is 13
      MessagePoller.submit()
  )




