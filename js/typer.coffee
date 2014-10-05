typograph = (node,delay = [50,70])->
  word = ''
  nextWrite = null

  base = delay[0]
  diff = delay[1]-delay[0]

  update = (word)->
    node.html(word)

  typeALetter = (letter)->
    word = "#{word}#{letter}"
    update(word)

  resetWord = ->
    word = ''
    update(word)

  typeAWord = (newWord)->
    resetWord()
    clearTimeout  nextWrite
    writeRecursive(newWord)

  writeRecursive = (newWord)->
    if newWord
      nextWrite = setTimeout((->
        typeALetter(newWord.first())
        writeRecursive(newWord.from(1))
      ),base+Math.floor(Math.random()*diff))

  {
    type: typeAWord
  }

module.exports = typograph