$(document).ready ()->
  # TODO requestAnimationFrame stuff
  pos = 1
  $window = $(window)
  $sections = []
  currentSectionIndex = 0
  headerHeight = 0

  # slide in hero text


  do calculateSections = ()->
    # cache sections, section heights
    $sections = $('.home-section').map ()->
      selector: $(this)
      top: $(this).offset().top
    setTimeout ()->
      $window.one('resize', calculateSections)
    , 1000

  do onScroll = ()->
    # debounced window scroll binding
    setTimeout ()->
      pos = $window.scrollTop()
      # condense top menu
      $('.site-header').toggleClass('condensed', pos > 100);
      headerHeight = $('.site-header').height()

      # determine "current" section
      $.each $sections, (index, item)->
        target = $sections[index+1]?.top || 99999
        if item.top <= (pos + headerHeight) < target
          item.selector.addClass 'current'
          currentSectionIndex = index
        else
          item.selector.removeClass 'current'
      $window.one( 'scroll', onScroll )
    , 1000

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