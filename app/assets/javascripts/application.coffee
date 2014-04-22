//= require jquery
//= require jquery_ujs

jQuery(document).ready ($) ->
    # Detect mobile browsers
    $.touchEnabled = typeof ontouchstart isnt 'undefined'
    $('body').addClass 'touchEnabled' if $.touchEnabled

    # Dropdown header menu
    $menu = $('body > header nav')
    $menu.on 'click', (e) ->
        $menu.toggleClass 'open'
        unless $(e.target).prop('tagName').toLowerCase() is 'a'
            e.preventDefault()
            return false
    $('html').click -> $menu.removeClass 'open'

    # Fixed header menu on scroll
    toggleFixeHeader = ->
        scrolled = $(window).scrollTop() >= 140
        tooSmall = $(window).height() < 680 or $(window).width() < 680
        $('body').toggleClass 'tooSmall', tooSmall
        $('body').toggleClass 'fixedHeader', scrolled or tooSmall or $.touchEnabled

    $(window).resize toggleFixeHeader
    $(window).scroll toggleFixeHeader
    toggleFixeHeader()

    unless $.touchEnabled

        adjustFold = ->
            # Adjust background sizing
            $('section.landing, section.quote, section.pic, section.header').css
                backgroundSize: if $(window).width() < 1600 then 'auto' else 'cover'

            # Adjust landing/title section height
            if $(window).height() < 600 or $(window).width() <= 480
                $('section.landing, section.header').css height: ''
            else
                newH = $(window).height() - $(window).scrollTop() - 200
                $('section.landing, section.header').css
                    height: if newH > 0 then newH else 0

        $(window).resize adjustFold
        $(window).scroll adjustFold
        adjustFold()
