require('sugar')
withWages = require('./sets')

coeff = 1/withWages.reduce(
  (sum,wageset)-> sum+wageset.wage
,0)

normalized = withWages.reduce(
  (map,wageSet)->
    {coll: map.coll + wageSet.wage*coeff, map: map.map.concat({set: wageSet.set, wage: map.coll + wageSet.wage*coeff})}
,{coll:0, map: []}).map.sortBy('wage')

selectRandomSet = ->
  x = Math.random()
  normalized.find((wageset)->wageset.wage>=x) or wageset.last()

selectRandomWord = do ->
  last5 = [null,null,null,null,null,null,null]
  randomizer = (set)->
    x = set.length
    y = set[Math.floor(Math.random()*x)]
    y = if y in last5 then randomizer(set) else y
    last5 = last5.from(1).concat(y)
    y

selectRandomWordFromRandomSet = -> selectRandomWord(selectRandomSet().set)

module.exports = selectRandomWordFromRandomSet