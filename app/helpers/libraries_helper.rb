module LibrariesHelper
  def system_logo_hash
    {'Nintendo Entertainment System' => 'nes-icon.png',
     'Game Boy' => 'gameboy.png',
     'Super Nintendo Entertainment System' => 'snes.png',
     'Nintendo 64' => 'n64.png',
     'Game Boy Color' => 'gameboycolor.png',
     'Game Boy Advance' => 'gba.png',
     'GameCube' =>  'gcn.png',
     'Nintendo DS' => 'nds.png',
     'Wii' => 'wii.png',
     'Wii U' => 'wiiu.png',
     'Nintendo 3DS' => 'n3ds.png',
     'Nintendo Switch' => 'switch.png',
     'Genesis' => 'genesis.png',
     'Game Gear' => 'gamegear.png',
     'Sega CD' =>  'segacd.png',
     'Sega Master System' => 'sms.png',
     'Dreamcast' => 'dreamcast.png',
     'Xbox' => 'xbox.ico',
     'Xbox 360' => 'x360.png',
     'Xbox One' => 'xbone.png',
     'PlayStation' => 'ps.png',
     'PlayStation 2' => 'ps2.png',
     'PlayStation 3' =>  'ps3.ico',
     'PlayStation Portable' => 'psp.ico',
     'PlayStation Vita' => 'psv.png',
     'PlayStation 4' => 'ps4.jpg',
     'Atari 2600' => 'atari2600.png',
     'Neo Geo' => 'neogeo.png',
     'TurboGrafx-16' => 'turbog.png'
    }
  end

  def my_copy_of(game)
    @library.game_purchases.where(game_id: game.id)[0]
  end

  def no_games?
    @library.games.empty? && @library.systems.empty?
  end

  def my_system(system)
    @library.system_purchases.where(system_id: system.id)[0]
  end


  def games_for(system)
    Game.joins(:libraries, :systems).where("systems.id = #{system.id}").where("libraries.id= #{@library.user.id}")
  end
end
