def add_workshop(track, name)
  FactoryGirl.create(:workshop,
    name: name,
    track_id: track.id
  )
end

track_general = FactoryGirl.create :track, name: 'General'
add_workshop track_general, 'Symantic HTML'
add_workshop track_general, 'Intro to Programming'
add_workshop track_general, 'Using Git & Github'

track_css = FactoryGirl.create(:track, name: 'CSS')
add_workshop track_css, 'Intro to CSS'
add_workshop track_css, 'Advanced CSS Concepts 1'
add_workshop track_css, 'Advanced CSS Concepts 2'

track_js = FactoryGirl.create(:track, name: 'JavaScript')
add_workshop track_js, 'Intro to JavaScript'
add_workshop track_js, 'JS: DOM Manipulation'
add_workshop track_js, 'JS: Functions'
add_workshop track_js, 'JS: Events'
add_workshop track_js, 'JS: Advanced Concepts'
add_workshop track_js, 'JS: Frameworks'
add_workshop track_js, 'Intro to CoffeeScript'

track_wp = FactoryGirl.create(:track, name: 'WordPress')
add_workshop track_wp, 'Intro to WordPress'
add_workshop track_wp, 'Intro to PHP'
add_workshop track_wp, 'Your First WordPress Theme'
add_workshop track_wp, 'Your First WordPress Plugin'

track_ror = FactoryGirl.create(:track, name: 'Ruby on Rails')
add_workshop track_ror, 'Intro to Ruby'
add_workshop track_ror, 'Intro to Rails'
add_workshop track_ror, 'Your First Rails App'
