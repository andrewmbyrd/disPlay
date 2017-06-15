# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'giant-bomber'



def seedCompanies
  Company.create!(name: "Nintendo")
  Company.create!(name: "Sega")
  Company.create!(name: "Microsoft")
  Company.create!(name: "Sony")
  Company.create!(name: "Atari")
  Company.create!(name: "SNK")
  Company.create!(name: "Hudson Soft")
end

def seedSystems
  agent = Agent.new(ENV["GIANT_API_KEY"])
  pid = agent.platform_id_hash
  pid2 = agent.platform_id_hash2

  pid = pid.merge(pid2)

  #Sony systems
  sony = Company.find_by(name: "Sony")
  playstation = agent.platform(pid["PlayStation"].to_i)
  System.create!(name: "PlayStation",
                 company: sony,
                 release_year: (playstation["release_date"]).to_i,
                 description: playstation["deck"],
                 img_url: playstation["image"]["small_url"])
  ps2 = agent.platform(pid["PlayStation 2"].to_i)
  System.create!(name: "PlayStation 2",
                 company: sony,
                 release_year: ps2["release_date"].to_i,
                 description: ps2["deck"],
                 img_url: ps2["image"]["small_url"])

  ps3 = agent.platform(pid["PlayStation 3"].to_i)
  System.create!(name: "PlayStation 3",
                 company: sony,
                 release_year: ps3["release_date"].to_i,
                 description: ps3["deck"],
                 img_url: ps3["image"]["small_url"])
  psp = agent.platform(pid["PlayStation Portable"].to_i)
  System.create!(name: "PlayStation Portable",
                 company: sony,
                 release_year: psp["release_date"].to_i,
                 description: psp["deck"],
                 img_url: psp["image"]["small_url"])
  psv = agent.platform(pid["PlayStation Vita"].to_i)
  System.create!(name: "PlayStation Vita", company: sony, release_year: psv["release_date"].to_i, description: psv["deck"], img_url: psv["image"]["small_url"])
  ps4 = agent.platform(pid["PlayStation 4"].to_i)
  System.create!(name: "PlayStation 4", company: sony, release_year: ps4["release_date"].to_i, description: ps4["deck"], img_url: ps4["image"]["small_url"])


  #Nintendo Systems
  nintendo = Company.find_by(name: "Nintendo")
  nes = agent.platform(pid["Nintendo Entertainment System"].to_i)
  System.create!(name: "Nintendo Entertainment System", company: nintendo, release_year: nes["release_date"].to_i, description: nes["deck"], img_url: nes["image"]["small_url"])
  gb = agent.platform(pid["Game Boy"].to_i)
  System.create!(name: "Game Boy", company: nintendo, release_year: gb["release_date"].to_i, description: gb["deck"], img_url: gb["image"]["small_url"])
  snes = agent.platform(pid["Super Nintendo Entertainment System"].to_i)
  System.create!(name: "Super Nintendo Entertainment System", company: nintendo, release_year: snes["release_date"].to_i, description: snes["deck"], img_url: snes["image"]["small_url"])
  n64 = agent.platform(pid["Nintendo 64"].to_i)
  System.create!(name: "Nintendo 64", company: nintendo, release_year: n64["release_date"].to_i, description: n64["deck"], img_url: n64["image"]["small_url"])
  gbc = agent.platform(pid["Game Boy Color"].to_i)
  System.create!(name: "Game Boy Color", company: nintendo, release_year: gbc["release_date"].to_i, description: gbc["deck"], img_url: gbc["image"]["small_url"])
  gba = agent.platform(pid["Game Boy Advance"].to_i)
  System.create!(name: "Game Boy Advance", company: nintendo, release_year: gba["release_date"].to_i, description: gba["deck"], img_url: gba["image"]["small_url"])
  gcn = agent.platform(pid["GameCube"].to_i)
  System.create!(name: "GameCube", company: nintendo, release_year: gcn["release_date"].to_i, description: gcn["deck"], img_url: gcn["image"]["small_url"])
  nds = agent.platform(pid["Nintendo DS"].to_i)
  System.create!(name: "Nintendo DS", company: nintendo, release_year: nds["release_date"].to_i, description: nds["deck"], img_url: nds["image"]["small_url"])
  wii = agent.platform(pid["Wii"].to_i)
  System.create!(name: "Wii", company: nintendo, release_year: wii["release_date"].to_i, description: wii["deck"], img_url: wii["image"]["small_url"])
  wiiu = agent.platform(pid["Wii U"].to_i)
  System.create!(name: "Wii U", company: nintendo, release_year: wiiu["release_date"].to_i, description: wiiu["deck"], img_url: wiiu["image"]["small_url"])
  n3ds = agent.platform(pid["Nintendo 3DS"].to_i)
  System.create!(name: "Nintendo 3DS", company: nintendo, release_year: n3ds["release_date"].to_i, description: n3ds["deck"], img_url: n3ds["image"]["small_url"])
  nsw = agent.platform(pid["Nintendo Switch"].to_i)
  System.create!(name: "Nintendo Switch", company: nintendo, release_year: nsw["release_date"].to_i, description: nsw["deck"], img_url: nsw["image"]["small_url"])



  # Microsoft systems
  microsoft = Company.find_by(name: "Microsoft")
  xbox = agent.platform(pid["Xbox"].to_i)
  System.create!(name: "Xbox", company: microsoft, release_year: xbox["release_date"].to_i, description: xbox["deck"], img_url: xbox["image"]["small_url"])
  xbox360 = agent.platform(pid["Xbox 360"].to_i)
  System.create!(name: "Xbox 360", company: microsoft, release_year: xbox360["release_date"].to_i, description: xbox360["deck"], img_url: xbox360["image"]["small_url"])
  xb1 = agent.platform(pid["Xbox One"].to_i)
  System.create!(name: "Xbox One", company: microsoft, release_year: xb1["release_date"].to_i, description: xb1["deck"], img_url: xb1["image"]["small_url"])

  #Sega Systems
  sega = Company.find_by(name: "Sega")
  gen = agent.platform(pid["Genesis"].to_i)
  System.create!(name: "Genesis", company: sega, release_year: gen["release_date"].to_i, description: gen["deck"], img_url: gen["image"]["small_url"] )
  gg = agent.platform(pid["Game Gear"].to_i)
  System.create!(name: "Game Gear", company: sega, release_year: gg["release_date"].to_i, description: gg["deck"], img_url: gg["image"]["small_url"] )
  scd = agent.platform(pid["Sega CD"].to_i)
  System.create!(name: "Sega CD", company: sega, release_year: scd["release_date"].to_i, description: scd["deck"], img_url: scd["image"]["small_url"] )
  sms = agent.platform(pid["Sega Master System"].to_i)
  System.create!(name: "Sega Master System", company: sega, release_year: sms["release_date"].to_i, description: sms["deck"], img_url: sms["image"]["small_url"] )
  sdc = agent.platform(pid["Dreamcast"].to_i)
  System.create!(name: "Dreamcast", company: sega, release_year: sdc["release_date"].to_i, description: sdc["deck"], img_url: sdc["image"]["small_url"] )

  #Atari system
  atari = Company.find_by(name: "Atari")
  at26 = agent.platform(pid["Atari 2600"].to_i)
  System.create!(name: "Atari 2600", company: atari, release_year: at26["release_date"].to_i, description: at26["deck"], img_url: at26["image"]["small_url"])

  #SNK systems
  snk = Company.find_by(name: "SNK")
  ngo = agent.platform(pid["Neo Geo"].to_i)
  System.create!(name: "Neo Geo", company: snk, release_year: ngo["release_date"].to_i, description: ngo["deck"], img_url: ngo["image"]["small_url"])

  #Hudson Soft
  hudson = Company.find_by(name: "Hudson Soft")
  tgx = agent.platform(pid["TurboGrafx-16"].to_i)
  System.create!(name: "TurboGrafx-16", company: hudson, release_year: tgx["release_date"].to_i, description: tgx["deck"], img_url: tgx["image"]["small_url"])

end


def seedGames
  agent = Agent.new('a0eca223270ba503cc6a461e918c96322de5fcfc')
  pid = agent.platform_id_hash
  pid2 = agent.platform_id_hash2
  numGames = 0
  pid = pid.merge(pid2)
  System.all.each do |system|
    puts "System: #{system.name}\n\n"
    games = agent.platform_games(pid[system.name])
    games.each do |game|
      numGames += 1
      puts "#{game["name"]}"
      g = Game.create!(title: game["name"],
                   genre: agent.game(game["id"])["genres"][0]["name"],
                   release_year: game["original_release_date"].to_i,
                   description: game["deck"],
                   img_url: game["image"]["small_url"])
      Release.create!(system_id: system.id, game_id: g.id)
    end
  end

  puts "#{numGames} games seeded!"

end


seedCompanies
seedSystems
seedGames
