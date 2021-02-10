# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Manufacturer.destroy_all
Disc.destroy_all

innova = Manufacturer.create!(name: 'Innova', founded_in: 1983, in_business: true)
axiom = Manufacturer.create!(name: 'Axiom', founded_in: 2014, in_business: true)
quest = Manufacturer.create!(name: 'Quest AT', founded_in: 2006, in_business: false)

innova.discs.create!(name: 'Aviar', max_weight: 176, in_production: true)
innova.discs.create!(name: 'Teebird', max_weight: 176, in_production: true)
innova.discs.create!(name: 'Moray', max_weight: 179, in_production: false)

axiom.discs.create!(name: 'Envy', max_weight: 174, in_production: true)
axiom.discs.create!(name: 'Proxy', max_weight: 174, in_production: true)
axiom.discs.create!(name: 'Alias', max_weight: 178, in_production: false)

quest.discs.create!(name: 'Raging Inferno DT', max_weight: 175, in_production: false)
quest.discs.create!(name: '10 Meter Crossfire', max_weight: 176, in_production: false)
