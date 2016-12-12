$ ->
  $('#start_date').on 'change', ->
    $('#end_date-error').css 'display', 'none'
    return
  # $('.search-btn').on 'click', ->
    # $('#search_filter').valid()
    # rooms = $('#select-drop').val()
    # guests = $('#guests').val()
    # start_date = $('#start_date').val()
    # end_date = $('#end_date').val()
    # date_start = if start_date == '' then moment().format('DD-MM-YYYY') else moment(start_date).format('DD-MM-YYYY')
    # date_end = if end_date == '' then moment().add('days', 3).format('DD-MM-YYYY') else moment(end_date).format('DD-MM-YYYY')
    # if start_date != '' and end_date != ''
      # window.location = '/rentals?rooms=' + rooms + '&start_date=' + date_start + '&end_date=' + date_end + '&guests=' + guests
    # return
  $('.view-offer-btn').on 'click', ->
    window.location = '/room_details/' + $(this).val()
    return
  documentWidth = $(window).width()
  left_arrow_path = $('.arrows').data 'left-arrow'
  right_arrow_path = $('.arrows').data 'right-arrow'
  left_blue_arrow_path = $('.arrows').data 'left-blue-arrow'
  backward_icon_path = $('.arrows').data 'backword-icon'
  forward_icon_path = $('.arrows').data 'forword-icon'


  left_arrow = "<img src='#{left_arrow_path}' height='12' width='24'/>"
  right_arrow = "<img src='#{right_arrow_path}' height='12' width='24'/>"
  left_blue_arrow = "<img src='#{left_blue_arrow_path}' height='12' width='24'/>"
  backward_icon = "<img src='#{backward_icon_path}' height='21' width='40'/>"
  forward_icon = "<img src='#{forward_icon_path}' height='21' width='40'/>"


  if documentWidth < 680
    $('.slider5').bxSlider
      slideWidth: 600
      minSlides: 1
      maxSlides: 1
  else
    $('.slider5').bxSlider
      minSlides: 1
      maxSlides: 1
      controls: true
      pager: false
      nextText: right_arrow
      prevText: left_blue_arrow
  $('.testimonial-slider').bxSlider
    slideWidth: 1100
    minSlides: 1
    maxSlides: 1
    slideMargin: 0
    controls: true
    pager: false
    prevText: backward_icon
    nextText: forward_icon
  $('.featured-attraction-slider').bxSlider
    minSlides: 3
    maxSlides: 3
    slideMargin: 0
    controls: true
    pager: false
    nextText: right_arrow
    prevText: left_arrow
  $('.navbar-inverse').css 'margin-top', '21px'
  $('.navbar-toggle').on 'click', ->
    if $(this).hasClass('collapsed')
      $('.site-header .hero.no-bg').hide()
      $('.main-content').hide()
    else
      $('.site-header .hero.no-bg').show()
      $('.main-content').show()
    return
  #Email validation
  jQuery.validator.addMethod 'custom_email', ((value, element) ->
    /^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/.test value
  ), 'Invalid email'
  $('.newsletter-subscribe-form').validate
    ignore: ' '
    rules: emailId:
      required: true
      custom_email: true
  return
