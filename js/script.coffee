$(document).ready ()->
  # TODO requestAnimationFrame stuff
  pos = 1
  $window = $(window)
  $sections = []
  currentSectionIndex = 0
  headerHeight = 0

  images = [
    #hero
    []
    # secure
    []
    # access
    [
      {id: 'access-computer', url: "browser/browser_animation.gif", parent: '#computer'}
    ]
    # share
    []
  ]

  # slide in hero text
  $('.hero-text').addClass('active')

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

      # trigger access animations
      startAnimations = for image in images[currentSectionIndex]
        unless $('#' + image.id)?.length > 0
          $(image.parent).find('.image-container')
            .append $("""
              <img id='#{image.id}'
              src='img/png/#{image.url}?#{Date.now()}'
              class='generated-image'/>
              """
            )

      #remove generated images from non-current sections
      clearAnimations = for section, index in $sections when index != currentSectionIndex
        section.selector.find('.generated-image').remove()

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