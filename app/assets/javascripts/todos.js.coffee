# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ()->
  $('#todos-list li a').click (e)->
    todoLi = $(e.target.parentElement.parentElement)
    todoLi.children('div').css('display', 'none')
    todoLi.children('input').css('display', 'initial').focus();

  $('#todos-list li input').keydown (e)->
    if e.keyCode == 13
      e.preventDefault()

      todoLi = $(e.target.parentElement)
      todoId = todoLi.data("todo-id")

      $.ajax({
        url:          "todos/#{todoId}/change_title"
        data:         JSON.stringify {
                        title: todoLi.children('input').first().val()
                      }
        type:        'PUT'
        contentType: 'application/json; charset=utf-8',
        dataType:    'json'
      })
      .then (response)->
        todoLi.find('span').text(response.title)
      .always ()->
        todoLi.children('div').css('display', 'initial')
        todoLi.children('input').css('display', 'none');


