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
