require('sugar')
randomWords = require('./randomWords')
typer = require('./typer')

myTyper = typer($('#text'),[50,70])

myTyper.type('Programming')

setInterval ->
  myTyper.type(randomWords())
,3000

makeFish = ->
  dir = if Number.random(0,1) is 0 then 'left' else 'right'
  size = Number.random(0,20)
  delay = -Number.random(0,4000)
  life = Number.random(40, 60) - (size / 2)

  fish = $("<img class='fish wave #{dir}' src='img/fish/#{Number.random(1,11)}.svg'>")
  fish.css(
    'animation-delay': (delay-900)+'ms'
    'height': (70 + size)+'px'
  )

  swayer = $("<span class='swim'>")
  swayer.css(
    'animation-delay': delay+'ms'
  )
  swayer.append(fish)

  tractor = $("<span class='tractor move-#{dir}'>")
  tractor.css(
    top: Number.random(5,95)+'%'
    'animation-duration': life+'s'
  )
  tractor.append(swayer)

  setTimeout(
    -> tractor.remove()
  , life*1000)

  tractor

newFish = (->
  $('.fishy').append(makeFish()))

setInterval(
  newFish
, 3000)

setTimeout newFish, 1000