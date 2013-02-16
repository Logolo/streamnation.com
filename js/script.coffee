$(document).ready ()->
  pos = 1
  $window = $(window)
  $sections = []
  currentSectionIndex = 0
  windowHeight = 0

  # GIFs to be loaded
  images = [
    #hero
    []
    # secure
    []
    # access
    [
      {id: 'computer', url: "browser/browser_animation.gif", delay:0}
      {id: 'ios', url: "ios/iphone_ipad_animation.gif", delay: 1000}
      {id: 'tv', url: 'tv/tv_animation.gif', delay: 2000}
    ]
    # share
    []
  ]

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
      startAnimations = for image in images[currentSectionIndex]
        unless $('#img-' + image.id)?.length > 0
          $('#' +image.id).find('.image-container')
            .append $("""
              <img id='img-#{image.id}'
              src='img/png/#{image.url}?#{Date.now()}'
              class='generated-image'/>
              """
            ).hide().delay(image.delay).show(0)

      #remove generated images from non-current sections
      clearAnimations = for section, index in $sections when index != currentSectionIndex
        section.selector.find('.generated-image').remove()

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