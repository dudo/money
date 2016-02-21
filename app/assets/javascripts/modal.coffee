$ ->
  $('.modal-state').on 'change', ->
    if $(this).is(':checked')
      $('body').addClass 'modal-open'
    else
      $('body').removeClass 'modal-open'
    return
  $('.modal-fade-screen, .modal-close').on 'click', ->
    $('.modal-state:checked').prop('checked', false).change()
    return
  $('.modal-inner').on 'click', (e) ->
    e.stopPropagation()
    return
  return