// Generated by CoffeeScript 1.8.0
(function() {
  var makeFish, myTyper, newFish, randomWords, typer;

  require('sugar');

  randomWords = require('./randomWords');

  typer = require('./typer');

  myTyper = typer($('#text'), [50, 70]);

  myTyper.type('Programming');

  setInterval(function() {
    return myTyper.type(randomWords());
  }, 3000);

  makeFish = function() {
    var delay, dir, fish, life, size, swayer, tractor;
    dir = Number.random(0, 1) === 0 ? 'left' : 'right';
    size = Number.random(0, 20);
    delay = -Number.random(0, 4000);
    life = Number.random(40, 60) - (size / 2);
    fish = $("<img class='fish wave " + dir + "' src='img/fish/" + (Number.random(1, 11)) + ".svg'>");
    fish.css({
      'animation-delay': (delay - 900) + 'ms',
      'height': (70 + size) + 'px'
    });
    swayer = $("<span class='swim'>");
    swayer.css({
      'animation-delay': delay + 'ms'
    });
    swayer.append(fish);
    tractor = $("<span class='tractor move-" + dir + "'>");
    tractor.css({
      top: Number.random(5, 95) + '%',
      'animation-duration': life + 's'
    });
    tractor.append(swayer);
    setTimeout(function() {
      return tractor.remove();
    }, life * 1000);
    return tractor;
  };

  newFish = (function() {
    return $('.fishy').append(makeFish());
  });

  setInterval(newFish, 3000);

  setTimeout(newFish, 1000);

}).call(this);

//# sourceMappingURL=main.js.map
