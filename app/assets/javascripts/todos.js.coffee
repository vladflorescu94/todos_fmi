# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ()->
  $('#todos-list li a:first-of-type').click (e)-> # clicking on edit link
    e.preventDefault();
    todoLi = $(e.target).closest('li')
    toggleEditableTodo(todoLi)
    todoLi.children('input').val(todoLi.find('span').first().text().trim())

  $('#todos-list li input').keydown (e)->
    if e.keyCode == 13
      e.preventDefault()

      todoLi = $(e.target).closest('li')
      todoId = todoLi.data("todo-id")

      $.ajax({
        url:          "todos/#{todoId}/change_title"
        data:         JSON.stringify title: todoLi.children('input').first().val()
        type:        'PUT'
        contentType: 'application/json; charset=utf-8',
        dataType:    'json'
      })
      .then (response)->
        todoLi.find('span').first().text(response.title)
      .always ()->
        toggleEditableTodo(todoLi)

  toggleEditableTodo = (todoListItem)->
    innerDiv   = todoListItem.children('div')
    innerInput = todoListItem.children('input')

    if innerDiv.css('display') == 'none'
      innerDiv.css('display', 'initial')
      innerInput.css('display', 'none')
    else
      innerDiv.css('display', 'none')
      innerInput.css('display', 'initial')
      innerInput.focus()

  $('#user-select-form select').first().on 'change', (e)->
    $('#user-select-form').trigger('submit')