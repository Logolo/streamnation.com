$(document).ready ()->
  pos = 1
  $window = $(window)
  $sections = []
  currentSectionIndex = 0
  windowHeight = 0
  $gifs = $('.reloading-gif')

  # slide in hero text
  $('.hero-text').addClass('active')
  $('.hero-signup-button').addClass('active')

  do calculateHeights = ()->
    # cache sections, section heights, window height
    $sections = $('.home-section').map ()->
      selector: $(this)
      top: $(this).offset().top

    windowHeight = $window.height()

    setTimeout ()->
      $window.one('resize', calculateHeights)
    , 1000

  do onScroll = ()->
    # debounced window scroll binding
    setTimeout ()->
      pos = $window.scrollTop()

      # condense top menu
      $('.site-header').toggleClass('condensed', pos > 100);

      # move signup footer to the bottom of the screen
      $('.signup-footer').toggleClass('bottom', pos > 20)

      # determine "current" section
      # when it crosses the window midpoint
      $.each $sections, (index, item)->
        sectionBottom = $sections[index+1]?.top || 99999
        if item.top <= pos + windowHeight/2  < sectionBottom
          item.selector.addClass 'current'
          currentSectionIndex = index
        else
          item.selector.removeClass 'current'

      # trigger one-shot GIF animations
      $gifs.each ()->
        src = $(this).data('src')
        delay = $(this).data('delay') || 0
        if $(this).closest('.home-section').hasClass('current')
          unless $(this).attr('src')?
            $(this)
              .delay(delay).show(0)
              .attr 'src', src + "?" + Date.now()
        else
          $(this).hide().attr('src', null)

      $window.one( 'scroll', onScroll )
    , 500

  # floating side navigation
  $('a', '.page-nav').click (e)->
    e.preventDefault()
    switch $(this).attr('id')
      when "prev-section" then index = currentSectionIndex - 1
      when "next-section" then index = currentSectionIndex + 1
      when "back-to-top" then index = 0
    if index < 0 then index = 0
    if index >= $sections.length then index = $sections.length - 1

    $('body').animate { scrollTop: $sections[index].top }, ()->
      # set current section immediately
      currentSectionIndex = index