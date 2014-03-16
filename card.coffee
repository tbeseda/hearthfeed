module.exports = class Card
  type_dictionary:
    type_3: 'Hero'
    type_4: 'Minion'
    type_5: 'Spell'
    type_7: 'Weapon'
    type_10: 'Hero Power'
  class_dictionary:
    class_1: 'Warrior'
    class_2: 'Paladin'
    class_3: 'Hunter'
    class_4: 'Rogue'
    class_5: 'Priest'
    class_7: 'Shaman'
    class_8: 'Mage'
    class_9: 'Warlock'
    class_11: 'Druid'
  quality_dictionary:
    quality_0: 'Free'
    quality_1: 'Common'
    quality_3: 'Rare'
    quality_4: 'Epic'
    quality_5: 'Legendary'
  keys_to_keep: ['name','description','attack','health','cost']

  constructor: (raw_card) ->
    @card = {}
    @card[key] = raw_card[key] for key in @keys_to_keep
    @card.type = @type_dictionary['type_'+raw_card.type]
    @card.class = @class_dictionary['class_'+raw_card.classs]
    @card.quality = @quality_dictionary['quality_'+raw_card.quality]
    @card.hearthhead_id = raw_card.id

    return @card
