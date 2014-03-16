request = require('request')
cheerio = require('cheerio')
json_lint = require('durable-json-lint')
Card = require('./card')

get_all_cards = (callback) ->
  request 'http://www.hearthhead.com/cards', (error, response, html) ->
    if !error and response.statusCode is 200
      $ = cheerio.load(html)
      # Extract and slice 'n' dice raw Javascript var
      raw_script = $('#lv-hearthstonecards').next('script').html()
      raw_script = raw_script.split('hearthstoneCards')[1]
      raw_script = raw_script.split('[')[1]
      raw_script = raw_script.split(']')[0]
      # Parse some malformed JSON
      raw_cards = JSON.parse(json_lint("[#{raw_script}]").json)

      console.log(raw_cards[0])

      cards = []
      for raw_card in raw_cards
        card = new Card raw_card
        cards.push(card)

      callback cards

task 'scrape:hearthhead', 'get some card data', ->
  get_all_cards (scraped_cards) ->
      console.log("Scraped #{scraped_cards.length} cards.")
      console.log('Example:', scraped_cards[0])
