module.exports = class Card
  keys_to_keep: ['name','description','attack','health','cost']
  dictionaries:
    type:
      type_3: 'Hero'
      type_4: 'Minion'
      type_5: 'Spell'
      type_7: 'Weapon'
      type_10: 'Hero Power'
    class:
      class_1: 'Warrior'
      class_2: 'Paladin'
      class_3: 'Hunter'
      class_4: 'Rogue'
      class_5: 'Priest'
      class_7: 'Shaman'
      class_8: 'Mage'
      class_9: 'Warlock'
      class_11: 'Druid'
    quality:
      quality_0: 'Free'
      quality_1: 'Common'
      quality_3: 'Rare'
      quality_4: 'Epic'
      quality_5: 'Legendary'

  constructor: (raw_card) ->
    @card = {}
    @card[key] = raw_card[key] for key in @keys_to_keep
    @card.type = @dictionaries.type['type_'+raw_card.type]
    @card.class = @dictionaries.class['class_'+raw_card.classs]
    @card.quality = @dictionaries.quality['quality_'+raw_card.quality]
    @card.hearthhead_id = raw_card.id

    return @card
