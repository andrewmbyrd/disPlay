# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def seedCompanies
  Company.create!(name: "Nintendo")
  Company.create!(name: "Sega")
  Company.create!(name: "Microsoft")
  Company.create!(name: "Sony")
  Company.create!(name: "Atari")
  Company.create!(name: "SNK")
  Company.create!(name: "Phillips")
  Company.create!(name: "Valve")
  Company.create!(name: "EA")
  Company.create!(name: "Ubisoft")
end

def seedSony
  #side note: find_by in Rails returns a singular object, whereas methods
  #like where, all, etc. return RELATIONS
  sony = Company.find_by(name: "Sony")
  System.create!(name: "Playstation",
                 company: sony,
                 release_year: 1995)
  System.create!(name: "Playstation 2",
                 company: sony,
                 release_year: 2000)
  System.create!(name: "Playstation 3",
                 company: sony,
                 release_year: 2006)
  System.create!(name: "Playstation 4",
                 company: sony,
                 release_year: 2013)
  System.create!(name: "Playstation Portable",
                 company: sony,
                 release_year: 2005)
  System.create!(name: "Playstation Vita",
                 company: sony,
                 release_year: 2012)
end

def seedNintendo
  nintendo = Company.find_by(name: "Nintendo")
  System.create!(name: "Nintendo Entertainment System",
                 company: nintendo,
                 release_year: 1985)
  System.create!(name: " Game Boy",
                 company: nintendo,
                 release_year: 1989)
  System.create!(name: "Super Nintendo Entertainment System",
                 company: nintendo,
                 release_year: 1991)
  System.create!(name: "Nintendo 64",
                 company: nintendo,
                 release_year: 1996)
  System.create!(name: "Game Boy Color",
                 company: nintendo,
                 release_year: 1998)
  System.create!(name: "Game Boy Advance",
                 company: nintendo,
                 release_year: 2001)
  System.create!(name: "GameCube",
                 company: nintendo,
                 release_year: 2001)
  System.create!(name: "Nintendo DS",
                 company: nintendo,
                 release_year: 2004)
  System.create!(name: "Wii",
                 company: nintendo,
                 release_year: 2006)
  System.create!(name: "Wii U",
                 company: nintendo,
                 release_year: 2012)

  System.create!(name: "Nintendo Switch",
                 company: nintendo,
                 release_year: 2017)
end

def seedNintendoNintendoEntertainmentSystem
  nes = System.find_by(name: "Nintendo Entertainment System")
  Game.create!(title: "The Legend of Zelda",
               genre: "adventure",
               system: nes,
               release_year: 1986)
  Game.create!(title: "Mario Bros.",
               genre: "platformer",
               system: nes,
               release_year: 1985)
  Game.create!(title: "Donkey Kong",
               genre: "action",
               system: nes,
               release_year: 1985)


end
seedCompanies

seedNintendo
seedSony

seedNintendoNintendoEntertainmentSystem
