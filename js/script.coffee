$(document).ready ()->
  pos = 1
  $window = $(window)
  $sections = []
  currentSectionIndex = 0
  windowHeight = 0
  $gifs = $('.reloading-gif')
  $header = $('.site-header')
  headerHeight = $header.height()
  footerTop = $('.site-footer').offset().top;
  $video = $('.background-video')

  # trigger one-shot hero animations
  $('#hero').addClass('active')

  # wait to play video
  setTimeout ()->
    $video[0].play()
  , parseInt($video.css('transition-delay'), 10) * 1000


  do calculateHeights = ()->
    windowHeight = $window.height()

    # auto-size hero to fill window
    $('#hero').height(7 + windowHeight - headerHeight)

    # cache sections, section heights, window height
    $sections = $('body').children('section').map ()->
      selector: $(this)
      top: $(this).offset().top


    setTimeout ()->
      $window.one('resize', calculateHeights)
    , 1000

  do onScroll = ()->
    # debounced window scroll binding
    setTimeout ()->
      pos = $window.scrollTop()

      # condense top menu
      if pos > $sections[1].top - headerHeight
        $header.addClass('condensed')
      else if pos <= headerHeight
        $header.removeClass('condensed')

      # manage "current" section
      $.each $sections, (index, item)->
        sectionBottom = $sections[index+1]?.top || footerTop
        if item.top <= pos + windowHeight/2  < sectionBottom
          item.selector.addClass 'current'
          currentSectionIndex = index
        else
          item.selector.removeClass 'current'

        # stickify section tabs
        item.selector.find('.next-tab, .back-to-top')
          .toggleClass('sticky', pos + windowHeight > sectionBottom )


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
    , 100

  # tab navigation
  $('.next-tab, .back-to-top').click (e)->
    e.preventDefault()

    if $(this).hasClass('next-tab')
      index = $(this).closest('section').index()
    else
      index = 0;

    $('body').animate { scrollTop: $sections[index].top }, ()->
      # set current section immediately
      currentSectionIndex = index