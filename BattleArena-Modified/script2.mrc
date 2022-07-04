on *:text:!go:#: {

  ; First, see if there's any players in the battle..
  set %number.of.players $readini($txtfile(battle2.txt), BattleInfo, Players)

  if (%battleisopen == on) { 
    if ((%number.of.players = 0) || (%number.of.players = $null)) {  
      $display.message($readini(translation.dat, battle, NoPlayersOnField), global)
      $endbattle($3)
    }
    if (%battle.type == dungeon) { $dungeon.begin }
    else { 
      /battlebegin

    }
  }
}

on *:text:!monlist:#: {

  var %curmon $findfile($mon_path, *.char, 0)
  set %mline $lines(m-name.txt)
  msg $chan We have actually %mline Monsters
  var %mn 10
  var %b1 0
  while (%curmon >= %b1) {
    ;echo -a %m
    inc %b1
    var %monname $remove($findfile($mon_path, *.char, %b1), .char,  $mircdir $+ Monsters\)
    if ($readini($mon(%monname), Info, Streak) != -1000) { write m-name.txt %monname }
    ;%mon-list = $addtok(%mon-list1, $read(m-name.txt, $rand(1, %mline)), 46) $+ . $+  $addtok(%mon-list1, $read(m-name.txt, $rand(1, %mline)), 46) $+ . $+ $addtok(%mon-list1, $read(m-name.txt, $rand(1, %mline)), 46) $+ . $+ $addtok(%mon-list1, $read(m-name.txt, $rand(1, %mline), $rand(1, %mline)), 46) $+ . $+ $addtok(%mon-list1, $read(m-name.txt, $rand(1, %mline), $rand(1, %mline)), 46) $+ . $+  $addtok(%mon-list1, $read(m-name.txt, $rand(1, %mline)), 46) $+ . $+  $addtok(%mon-list1, $read(m-name.txt, $rand(1, %mline)), 46) $+ . $+  $addtok(%mon-list1, $read(m-name.txt, $rand(1, %mline)), 46) $+ . $+  $addtok(%mon-list1, $read(m-name.txt, $rand(1, %mline)), 46) $+ . $+  $addtok(%mon-list1, $read(m-name.txt, $rand(1, %mline)), 46)     
    ;set %n1 $rand(1,$numtok(%mon-list, 46))
    ;set %n2 $rand(1,$numtok(%mon-list, 46))
    ;set %mon-to-add1 $gettok(%mon-list,%n2 $+ - $+ %n1, 46)
    ;msg #AiroRPG %mon-to-add1
  }
}

alias dungeon.content {
  set %dfolder $mircdir $+ dungeons\
  set %rooms1 $readini(%dfolder $+ CreatedDungeon.dungeon, Info, Rooms)
  set %froom1 $calc(%rooms1 - 1)
  set %v $calc(%froom1 - 1)
  set %chestraum $rand(2, $calc(%froom1 - 1))
  set %restroom $rand(2, $calc(%froom1 - 1))
  var %dungfile %dfolder  $+ CreatedDungeon.dungeon
  if ($readini(%dfolder $+ CreatedDungeon $+ .dungeon, %chestraum, desc) != $null) && ($readini(%dfolder $+ CreatedDungeon $+ .dungeon, %chestraum, Restroom) == $null)  {
    remini %dfolder $+ CreatedDungeon $+ .dungeon %chestraum
    writeini %dfolder $+ CreatedDungeon $+ .dungeon %chestraum Desc 2[Room: 8 $+ ChestRoom $+ 2] this is a Treasure Chest Room the content gets a player
    writeini %dfolder $+ CreatedDungeon $+ .dungeon %chestraum BattleField $readini(%dfolder $+ CreatedDungeon $+ .dungeon, Info, Name)
    writeini %dfolder $+ CreatedDungeon $+ .dungeon %chestraum Chestroom true
    echo -a ChestRaum erstellt: Raumnummer %chestraum
  }

  if ($readini(%dfolder $+ CreatedDungeon $+ .dungeon, %restroom, desc) != $null) && ($readini(%dfolder $+ CreatedDungeon $+ .dungeon, %restroom, ChestRoom) == $null)  {
    remini %dfolder $+ CreatedDungeon $+ .dungeon %restroom
    writeini %dfolder $+ CreatedDungeon $+ .dungeon %restroom Desc 2[Room: 8 $+ RestRoom $+ 2] In This room players automatically Healed or so....
    writeini %dfolder $+ CreatedDungeon $+ .dungeon %restroom BattleField $readini(%dfolder $+ CreatedDungeon $+ .dungeon, Info, Name)
    writeini %dfolder $+ CreatedDungeon $+ .dungeon %restroom RestRoom true
    echo -a RestoreRaum erstellt: Raumnummer %restroom
  }

}

alias mondung {
  ;var %curmon $findfile($mon_path, *.char, 0)
  var %mline $lines(m-name.txt)
  var %dfolder $mircdir $+ dungeons\
  msg $chan We have actually %mline Monsters
  var %mn 10
  var %b1 0
  while (%mn >= %b1) {
    ;echo -a %m
    inc %b1 1
    var %monname $remove($findfile($mon_path, *.char, %b1), .char, $mircdir $+ Monsters\)
    ;if ($readini($mon(%b1), Info, Streak) != -1000) { write m-name.txt %monname }
    %mon-list = $addtok(%mon-list1, $read(m-name.txt, $rand(1, %mline)), 46) $+ . $+  $addtok(%mon-list1, $read(m-name.txt, $rand(1, %mline)), 46) $+ . $+ $addtok(%mon-list1, $read(m-name.txt, $rand(1, %mline)), 46) $+ . $+ $addtok(%mon-list1, $read(m-name.txt, $rand(1, %mline), $rand(1, %mline)), 46) $+ . $+ $addtok(%mon-list1, $read(m-name.txt, $rand(1, %mline), $rand(1, %mline)), 46) $+ . $+  $addtok(%mon-list1, $read(m-name.txt, $rand(1, %mline)), 46) $+ . $+  $addtok(%mon-list1, $read(m-name.txt, $rand(1, %mline)), 46) $+ . $+  $addtok(%mon-list1, $read(m-name.txt, $rand(1, %mline)), 46) $+ . $+  $addtok(%mon-list1, $read(m-name.txt, $rand(1, %mline)), 46) $+ . $+  $addtok(%mon-list1, $read(m-name.txt, $rand(1, %mline)), 46)     
    set %n1 $rand(1,$numtok(%mon-list, 46))
    set %n2 $rand(1,$numtok(%mon-list, 46))
    set %mon-to-add1 $gettok(%mon-list,%n2 $+ - $+ %n1, 46)
    writeini %dfolder $+ CreatedDungeon $+ .dungeon MonsterList %b1 %mon-to-add1  
  }
}
