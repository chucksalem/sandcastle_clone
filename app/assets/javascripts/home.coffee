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
      nextText: '<img src="assets/right-arrow.png" height="12" width="24"/>'
      prevText: '<img src="assets/left_blue_arrow.png" height="12" width="24"/>'
  $('.testimonial-slider').bxSlider
    slideWidth: 1100
    minSlides: 1
    maxSlides: 1
    slideMargin: 0
    controls: true
    pager: false
    nextText: '<img src="assets/forword-icon.png" height="21" width="40"/>'
    prevText: '<img src="assets/backword-icon.png" height="21" width="40"/>'
  $('.featured-attraction-slider').bxSlider
    minSlides: 3
    maxSlides: 3
    slideMargin: 0
    controls: true
    pager: false
    nextText: '<img src="assets/right-arrow.png" height="12" width="24"/>'
    prevText: '<img src="assets/Left-arrow.png" height="12" width="24"/>'
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
