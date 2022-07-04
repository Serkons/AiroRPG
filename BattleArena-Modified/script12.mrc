on 1:text:!!aug*:#: { 
  set %nick $2

  ;; check if $2 is a player in the game or not, if not do nothing
  if ($isfile($char($2)) != $true) { msg # sorry $2 is not a player in this game }

  ;;;;;;;define the augments that stored in a file.

  var %aug1 $lines($lstfile(augments.lst))
  set %augline $rand(1,%aug1)  
  while (%aug1 >= 1) {
    %augs = $addtok(%augs, $read($lstfile(augments.lst), %aug1), 46)
    dec %aug1
    ;echo Zufälliges Augment %augs
  }

  ;;;;;;;;;;;;;generate an itemname

  $set_item_names

  ;;;;;;;;;;;;;;;;;;;;check if the item exists if not write the data to the file

  if (%equipmentprefix isin $read($lstfile(armor_body.lst), w, * $+ %equipmentprefix $+ *)) || (%equipmentprefix isin $read($lstfile(armor_head.lst), w, * $+ %equipmentprefix $+ *)) || (%equipmentprefix isin $read($lstfile(armor_feet.lst), w, * $+ %equipmentprefix $+ *)) || (%equipmentprefix isin $read($lstfile(armor_legs.lst), w, * $+ %equipmentprefix $+ *)) || (%equipmentprefix isin $read($lstfile(armor_hands.lst), w, * $+ %equipmentprefix $+ *)) && ($readini($dbfile(equipment.db), %equipmentprefix, Name) != $null) { 

    msg $chan rüstung existiert bereits kann nicht erstellt werden.
  }
  if (%equipmentprefix !isin $read($lstfile(armor_body.lst), w, * $+ %equipmentprefix $+ *)) || (%equipmentprefix !isin $read($lstfile(armor_head.lst), w, * $+ %equipmentprefix $+ *)) || (%equipmentprefix !isin $read($lstfile(armor_feet.lst), w, * $+ %equipmentprefix $+ *)) || (%equipmentprefix !isin $read($lstfile(armor_legs.lst), w, * $+ %equipmentprefix $+ *)) || (%equipmentprefix !isin $read($lstfile(armor_hands.lst), w, * $+ %equipmentprefix $+ *)) && ($readini($dbfile(equipment.db), %equipmentprefix, Name) == $null) { 
    msg $chan %equipmentprefix does not exist and can be created
    $generate_armor(%nick)
    msg $chan Armor %equipmentprefix was successfully generated.
  }
}

alias create_armor1 {

  ;;;;;;;define the augments that stored in a file.

  var %aug1 $lines($lstfile(augments.lst))
  set %augline $rand(1,%aug1)  
  while (%aug1 >= 1) {
    %augs = $addtok(%augs, $read($lstfile(augments.lst), %aug1), 46)
    dec %aug1
    ;echo Zufälliges Augment %augs
  }

  ;;;;;;;;;;;;;generate an itemname

  $set_item_names1

  ;;;;;;;;;;;;;;;;;;;;check if the item exists if not write the data to the file

  if (%equipmentprefix1 isin $read($lstfile(armor_body.lst), w, * $+ %equipmentprefix $+ *)) || (%equipmentprefix1 isin $read($lstfile(armor_head.lst), w, * $+ %equipmentprefix1 $+ *)) || (%equipmentprefix1 isin $read($lstfile(armor_feet.lst), w, * $+ %equipmentprefix1 $+ *)) || (%equipmentprefix1 isin $read($lstfile(armor_legs.lst), w, * $+ %equipmentprefix1 $+ *)) || (%equipmentprefix1 isin $read($lstfile(armor_hands.lst), w, * $+ %equipmentprefix1 $+ *)) && ($readini($dbfile(equipment.db), %equipmentprefix1, Name) != $null) { 

    msg $chan Rüstung existiert bereits kann nicht erstellt werden.
  }
  if (%equipmentprefix1 !isin $read($lstfile(armor_body.lst), w, * $+ %equipmentprefix $+ *)) || (%equipmentprefix1 !isin $read($lstfile(armor_head.lst), w, * $+ %equipmentprefix1 $+ *)) || (%equipmentprefix1 !isin $read($lstfile(armor_feet.lst), w, * $+ %equipmentprefix1 $+ *)) || (%equipmentprefix1 !isin $read($lstfile(armor_legs.lst), w, * $+ %equipmentprefix1 $+ *)) || (%equipmentprefix1 !isin $read($lstfile(armor_hands.lst), w, * $+ %equipmentprefix1 $+ *)) && ($readini($dbfile(equipment.db), %equipmentprefix1, Name) == $null) { 
    echo %equipmentprefix1 does not exist and can be created
    echo Armor %equipmentprefix1 was successfully generated.
  }
}

alias create_armor2 {

  ;;;;;;;define the augments that stored in a file.

  var %aug1 $lines($lstfile(augments.lst))
  set %augline $rand(1,%aug1)  
  while (%aug1 >= 1) {
    %augs = $addtok(%augs, $read($lstfile(augments.lst), %aug1), 46)
    dec %aug1
    ;echo Zufälliges Augment %augs
  }

  ;;;;;;;;;;;;;generate an itemname

  $set_item_names2

  ;;;;;;;;;;;;;;;;;;;;check if the item exists if not write the data to the file

  if (%equipmentprefix2 isin $read($lstfile(armor_body.lst), w, * $+ %equipmentprefix2 $+ *)) || (%equipmentprefix2 isin $read($lstfile(armor_head.lst), w, * $+ %equipmentprefix2 $+ *)) || (%equipmentprefix2 isin $read($lstfile(armor_feet.lst), w, * $+ %equipmentprefix2 $+ *)) || (%equipmentprefix2 isin $read($lstfile(armor_legs.lst), w, * $+ %equipmentprefix2 $+ *)) || (%equipmentprefix2 isin $read($lstfile(armor_hands.lst), w, * $+ %equipmentprefix2 $+ *)) && ($readini($dbfile(equipment.db), %equipmentprefix2, Name) != $null) { 

    msg $chan Rüstung existiert bereits kann nicht erstellt werden.
  }
  if (%equipmentprefix2 !isin $read($lstfile(armor_body.lst), w, * $+ %equipmentprefix2 $+ *)) || (%equipmentprefix2 !isin $read($lstfile(armor_head.lst), w, * $+ %equipmentprefix2 $+ *)) || (%equipmentprefix2 !isin $read($lstfile(armor_feet.lst), w, * $+ %equipmentprefix2 $+ *)) || (%equipmentprefix2 !isin $read($lstfile(armor_legs.lst), w, * $+ %equipmentprefix2 $+ *)) || (%equipmentprefix2 !isin $read($lstfile(armor_hands.lst), w, * $+ %equipmentprefix2 $+ *)) && ($readini($dbfile(equipment.db), %equipmentprefix2, Name) == $null) { 
    echo %equipmentprefix2 does not exist and can be created
    echo Armor %equipmentprefix2 was successfully generated.
  }
}

alias give_armor_chest {
  if (((%battle.type = monster) || (%battle.type = dragonhunt) || (%battle.type = HQ-GEN) || (%battle.type = dungeon))) { var %reward.chance 100 }
  else { 
    var %reward.chance $rand(1,100)
    inc %reward.chance $treasurehunter.check

    if (%battle.type = mimic) { var %reward.chance 100 }
  }

  if ($left($adate, 2) = 10) { inc %reward.chance 10 }

  if (%reward.chance < 65) { return }

  var %aline $lines($txtfile(Battle.txt))
  if ($return_playersinbattle >= 2) { 
    set %item.winner1 $read -l $+ $rand(1, %aline) $txtfile(battle.txt)
    set %item.winner2 $read -l $+ $rand(1, %aline) $txtfile(battle.txt)
    set %winner.flag1 $readini($char(%item.winner1), info, flag)
    set %winner.flag2 $readini($char(%item.winner2), info, flag)
  }
  if ($return_playersinbattle <= 1) { 
    set %item.winner1 $read -l $+ 1 $txtfile(battle.txt)
    set %winner.flag1 $readini($char(%item.winner1), info, flag)
  }
  if (%winner.flag1 != monster) && (%winner.flag1 != npc) {
    set %nick1 %item.winner1
    $create_armor1
    $generate_armor1
    if (%varchance2a <= 51) {
      set %item.total $readini($char(%item.winner1), item_amount, %equipmentprefix1)
      if (%item.total = $null) { writeini $char(%item.winner1) item_amount %equipmentprefix1 1 }
      else { inc %item.total 1 | writeini $char(%item.winner1) item_amount %equipmentprefix1 %item.total }
      $set_chr_name(%item.winner1)
      if ($istok(%gerade,%diff,46) == $true) || (%diff <= 16) && (%diff >= 10) { set %seltenheit 7(4 Uncommon 7) }
      if ($istok(%gerade,%diff,46) == $true) || (%diff <= 10) && (%diff >= 6) { set %seltenheit 7(6 Common 7) }     
      if ($istok(%gerade,%diff,46) == $true) || (%diff <= 5) && (%diff >= 1) { set %seltenheit 7(4 Rare 7)  }
      %arm-info1 = $addtok(%arm-info1, 4  %equipmentprefix1  (7 %location-a )  %seltenheit, 46)
      var %mess 3 $+ %item.winner1  gets the new armor 4  %equipmentprefix  (7 %location-a )
      var %mess1 3 $+ %item.winner1  gets the new armor:  %arm-info1
      $display.message(%mess1, battle)
      set %nick %item.winner1 
      unset %arm-info1
      haltdef
    }
  }
  if ((%winner.flag2 != monster) && (%winner.flag2 != npc) && (%item.winner2 != $null)) {
    set %nick2 %item.winner2 
    $create_armor2
    $generate_armor2
    if (%varchance2a <= 51) {
      set %item.total $readini($char(%item.winner2), item_amount, %equipmentprefix2)
      if (%item.total = $null) { writeini $char(%item.winner2) item_amount %equipmentprefix2 1 }
      else { inc %item.total 1 | writeini $char(%item.winner2) item_amount %equipmentprefix2 %item.total }
      $set_chr_name(%item.winner2)
      %arm-info2 = $addtok(%arm-info2, 4  %equipmentprefix2  (7 %location-a ) %seltenheit, 46)
      if ($istok(%gerade,%diff,46) == $true) || (%diff <= 16) && (%diff >= 10) { set %seltenheit 7(4 Uncommon 7) }
      if ($istok(%gerade,%diff,46) == $true) || (%diff <= 10) && (%diff >= 6) { set %seltenheit 7(6 Common 7) }
      if ($istok(%gerade,%diff,46) == $true) || (%diff <= 5) && (%diff >= 1) { set %seltenheit 7(4 Rare 7) }
      ;var %mess1 3 $+ %item.winner2  gets the new armor 4  %equipmentprefix  (7 %location-a )
      var %mess2 3 $+ %item.winner2  gets the new armor:  %arm-info2
      $display.message(%mess2, battle)
      set %nick2 %item.winner2 
      unset %arm-info2
      haltdef
    }
  }
}

on *:text:!diff:#: { if (%diff isnum 11-16) { set %varchance2a $rand(1,12) } }

alias generate_armor1 {
  var %validequiplocations head.body.legs.feet.hands
  set %random.location $rand(1, $numtok(%validequiplocations,46))
  set %location-a $gettok(%validequiplocations, %random.location, 46)
  var %armorname %equipmentprefix1
  ;set %ahp $randnow2(1,450, 1,900, 60)
  ;set %atp $randnow2(1,50, 1,200, 60)
  ;set %aDef $randnow2(1,$rand(1,2500), 1,$rand(1,5000), 60)
  ;set %aint $randnow2(1,$rand(1,2500), 1,$rand(1,5000), 60)
  ;set %aspd $randnow2(1,$rand(1,2500), 1,$rand(1,5000), 60)
  ;set %astr $randnow2(1,$rand(1,2500), 1,$rand(1,5000), 60)
  var %augment %augments
  var %location %location-a
  var %cost 0
  set %aSellprice $randnow2(1,2500, 1, 5000, 60)
  ;set %aLevel $randnow2(1,10500, 1, 21000, 60)
  set %aLevel $calc($get.level(%nick) - 1)
  set %protection-a $calc($rand(1,10) / 10 + %diff)
  $get.mid.vert1(%nick1)
  $generate_values
  set %mid.vert.new.eq $round($calc(%ahp + %atp + %astr + %int + %adef + %aspd / 6),0)
  if (%mid.vert.current.eq < %mid.vert.new.eq) && (%varchance2a <= 51) {
    write $lstfile(armor_ $+ %location-a $+ .lst) %armorname
    writeini $dbfile(Equipment.db) %equipmentprefix1 Name %armorname
    writeini $dbfile(Equipment.db) %equipmentprefix1 Hp %ahp
    writeini $dbfile(Equipment.db) %equipmentprefix1 Tp %atp
    writeini $dbfile(Equipment.db) %equipmentprefix1 Str %astr
    writeini $dbfile(Equipment.db) %equipmentprefix1 Def %adef
    writeini $dbfile(Equipment.db) %equipmentprefix1 Int %aint
    writeini $dbfile(Equipment.db) %equipmentprefix1 Spd %aspd
    writeini $dbfile(Equipment.db) %equipmentprefix1 Augment %augments
    writeini $dbfile(Equipment.db) %equipmentprefix1 EquipLocation %location
    writeini $dbfile(Equipment.db) %equipmentprefix1 Cost 0
    writeini $dbfile(Equipment.db) %equipmentprefix1 SellPrice %aSellprice
    writeini $dbfile(Equipment.db) %equipmentprefix1 LevelRequirement %aLevel
    writeini $dbfile(Equipment.db) %equipmentprefix1 Protection %protection-a
    ;msg #AiroRPG %nick1 Gets the following armor: %equipmentprefix1 $+ . with this Attributes HP: %ahp TP: %atp STR: %astr DEF: %adef INT: %aint SPD: %aspd Level: %alevel -> Location: %location -> Augments: %augments
    unset %augments
  }
}

alias generate_armor2 {
  var %validequiplocations head.body.legs.feet.hands
  set %random.location $rand(1, $numtok(%validequiplocations,46))
  set %location-a $gettok(%validequiplocations, %random.location, 46)
  var %armorname %equipmentprefix2
  ;set %ahp $randnow2(1,450, 1,900, 60)
  ;set %atp $randnow2(1,50, 1,200, 60)
  ;set %aDef $randnow2(1,$rand(1,2500), 1,$rand(1,5000), 60)
  ;set %aint $randnow2(1,$rand(1,2500), 1,$rand(1,5000), 60)
  ;set %aspd $randnow2(1,$rand(1,2500), 1,$rand(1,5000), 60)
  ;set %astr $randnow2(1,$rand(1,2500), 1,$rand(1,5000), 60)
  var %augment %augments
  var %location %location-a
  var %cost 0
  set %aSellprice $randnow2(1,2500, 1, 5000, 60)
  ;set %aLevel $randnow2(1,10500, 1, 21000, 60)
  set %aLevel $calc($get.level(%nick2) - 1)
  set %protection-a $calc($rand(1,10) / 10 + %diff)
  $get.mid.vert1(%nick2)
  $generate_values
  set %mid.vert.new.eq $round($calc(%ahp + %atp + %astr + %int + %adef + %aspd / 6),0)
  if (%mid.vert.current.eq < %mid.vert.new.eq) && (%varchance2a <= 51) {
    write $lstfile(armor_ $+ %location-a $+ .lst) %armorname
    writeini $dbfile(Equipment.db) %equipmentprefix2 Name %armorname
    writeini $dbfile(Equipment.db) %equipmentprefix2 Hp %ahp
    writeini $dbfile(Equipment.db) %equipmentprefix2 Tp %atp
    writeini $dbfile(Equipment.db) %equipmentprefix2 Str %astr
    writeini $dbfile(Equipment.db) %equipmentprefix2 Def %adef
    writeini $dbfile(Equipment.db) %equipmentprefix2 Int %aint
    writeini $dbfile(Equipment.db) %equipmentprefix2 Spd %aspd
    writeini $dbfile(Equipment.db) %equipmentprefix2 Augment %augments
    writeini $dbfile(Equipment.db) %equipmentprefix2 EquipLocation %location
    writeini $dbfile(Equipment.db) %equipmentprefix2 Cost 0
    writeini $dbfile(Equipment.db) %equipmentprefix2 SellPrice %aSellprice
    writeini $dbfile(Equipment.db) %equipmentprefix2 LevelRequirement %aLevel
    writeini $dbfile(Equipment.db) %equipmentprefix2 Protection %protection-a
    ;msg #AiroRPG %nick2 Gets the following armor: %equipmentprefix2 $+ . with this Attributes HP: %ahp TP: %atp STR: %astr DEF: %adef INT: %aint SPD: %aspd Level: %alevel -> Location: %location -> Augments: %augments
    unset %augments
  }
}

alias get.mid.vert1 {
  set %current.equipped $readini($char(%nick1), equipment, %location-a)
  if (%current.equipped == nothing) { set %mid.vert.current.eq 0 | set %eq-hp 0 | set %eq-tp 0 | set %eq-str 0 | set %eq-def 0 | set %eq-int 0 | set %eq-spd 0
    set %mid.vert.current.eq $round($calc(%eq-hp + %eq-tp + %eq-str + %eq-def + %eq-int + %eq-spd / 6), 0)
    echo -a The Mid value of $1 Armor is: %mid.vert.current.eq
  }
  if (%current.equipped != nothing) {
    set %eq-hp $readini($dbfile(equipment.db), %current.equipped, hp)
    set %eq-tp $readini($dbfile(equipment.db), %current.equipped, tp)
    set %eq-str $readini($dbfile(equipment.db), %current.equipped, str)
    set %eq-def $readini($dbfile(equipment.db), %current.equipped, def)
    set %eq-int $readini($dbfile(equipment.db), %current.equipped, int)
    set %eq-spd $readini($dbfile(equipment.db), %current.equipped, spd)
    set %mid.vert.current.eq $round($calc(%eq-hp + %eq-tp + %eq-str + %eq-def + %eq-int + %eq-spd / 6), 0)
    echo -a The Mid value of %nick Armor is: %mid.vert.current.eq
  }
}

alias get.mid.vert2 {
  set %current.equipped $readini($char(%nick2), equipment, %location-a)
  if (%current.equipped == nothing) { set %mid.vert.current.eq 0 | set %eq-hp 0 | set %eq-tp 0 | set %eq-str 0 | set %eq-def 0 | set %eq-int 0 | set %eq-spd 0
    set %mid.vert.current.eq $round($calc(%eq-hp + %eq-tp + %eq-str + %eq-def + %eq-int + %eq-spd / 6), 0)
    echo -a The Mid value of $1 Armor is: %mid.vert.current.eq
  }
  if (%current.equipped != nothing) {
    set %eq-hp $readini($dbfile(equipment.db), %current.equipped, hp)
    set %eq-tp $readini($dbfile(equipment.db), %current.equipped, tp)
    set %eq-str $readini($dbfile(equipment.db), %current.equipped, str)
    set %eq-def $readini($dbfile(equipment.db), %current.equipped, def)
    set %eq-int $readini($dbfile(equipment.db), %current.equipped, int)
    set %eq-spd $readini($dbfile(equipment.db), %current.equipped, spd)
    set %mid.vert.current.eq $round($calc(%eq-hp + %eq-tp + %eq-str + %eq-def + %eq-int + %eq-spd / 6), 0)
    echo -a The Mid value of %nick Armor is: %mid.vert.current.eq
  }
}

alias set_item_names1 {
  var %prefixline $lines(prefix.txt)
  var %suffixline $lines(suffix.txt)
  set %equipmentprefix1 $replace($read(suffix.txt, $rand(1,%suffixline)),$chr(32),_) $+ _ $+ $replace($read(prefix.txt, $rand(1,%prefixline)),$chr(32),_)
  var %equipmentprefix1
}

alias set_item_names2 {
  var %prefixline $lines(prefix.txt)
  var %suffixline $lines(suffix.txt)
  set %equipmentprefix2 $replace($read(suffix.txt, $rand(1,%suffixline)),$chr(32),_) $+ _ $+ $replace($read(prefix.txt, $rand(1,%prefixline)),$chr(32),_)
  var %equipmentprefix2
}
