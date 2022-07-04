; Neue Admin Befehle:
on 50:text:!set system ShopLevel*:#: {
  if ($4 !Isnum) { msg $chan 4Error: Please set a number for the level }
  /writeini system.dat system maxshoplevel $4
  msg $chan The Max Shoplevel is set to: 11 " $+ $4 $+ "
}

on 50:text:!set system EnableDoppenganger*:#: {
  if ($4 == true) || ($4 == false) { 
    writeini system.dat system EnableDoppenganger $4
    var %endop $readini system.dat system EnableDoppenganger 
    msg $chan The Doppelganger Bossfight is now: 11 " $+ $iif(%endop == false, disabled, enabled) $+ "
  }
}

on *:text:!chest *:#: {
  var %chest1content $rand(1,500)
  var %chest2content $rand(1,500)
  var %chest3content $rand(1,500)
  var %nick $nick
  if (%bchest == on) {
    if ($2 == 1) && (!%chest1. $+ %nick) && (!%chest1open) { 
      var %curorbs $readini($char($nick), Stuff, redorbs)
      var %setorbs $calc(%curorbs + %chest1content)
      writeini $char($nick) Stuff redorbs %setorbs
      msg $chan Congratulation $nick you get %chest1content bonus orbs
      set %chest1. $+ %nick on
      set %chest1open on
      halt
    }
    if ($2 == 1) && (%chest1open == on)  {
      msg $chan Sorry $nick Chest 1 was already opend. Sorry.
      halt   
    }
    if ($2 == 2) && (!%chest2. $+ %nick) && (!%chest2open) { 
      var %curorbs $readini($char($nick), Stuff, redorbs)
      var %setorbs $calc(%curorbs + %chest2content)
      writeini $char($nick) Stuff redorbs %setorbs
      msg $chan Congratulation $nick you get %chest2content bonus orbs
      set %chest2. $+ %nick on
      set %chest2open on
      halt
    }
    if ($2 == 2) && (%chest2open == on)  {
      msg $chan Sorry $nick Chest 2 was already opend. Sorry.
      halt   
    }
    if ($2 == 3) && (!%chest3. $+ %nick) && (!%chest3open) { 
      var %curorbs $readini($char($nick), Stuff, redorbs)
      var %setorbs $calc(%curorbs + %chest3content)
      writeini $char($nick) Stuff redorbs %setorbs
      msg $chan Congratulation $nick you get %chest3content bonus orbs
      set %chest3. $+ %nick on
      set %chest3open on
      halt
    }
    if ($2 == 3) && (%chest3open == on)  {
      msg $chan Sorry $nick Chest 3 was already opend. Sorry.
      halt   
    }
  }
  else if (%bchest == $null) {
    msg $chan Sorry the time for bonuschest is empty sorry for that. :(
  }
}

alias bonusmat {
  unset %chest1.*
  unset %chest2.*
  unset %chest3.*
  unset %chest1open
  unset %chest2open
  unset %chest3open
  set -u45 %bchest on
  msg #AiroRPG 1,1---------7,1[BonusChestEvent]1,1---------
  msg #AiroRPG It's that time again. You can open 3 treasure chests. - so write !chest <num> to open them.
  msg #AiroRPG So the chest are:  $+ $rand(0,15) $+ Chest 1  $+ $rand(0,15) $+ Chest 2  $+ $rand(0,15) $+ Chest 3 Good Luck Players :)
}



on 50:text:!toggle Autoregen*:#: {
  if ($3 == monster) && ($exists($mon($4)) == $true) {
    var %autoregen $readini($mon($4), Status, auto-Regen)
    if (%autoregen == $null) || (%autoregen == no) {
      writeini $mon($4) Status auto-regen yes
      writeini $mon($4) Skills Regen $rand(1,20)
      msg $chan Auto-Regen for $4 is now 11" $readini($mon($4), Status, auto-Regen) "
      halt
    }
    if (%autoregen == $null) || (%autoregen == yes) {
      writeini $mon($4) Status auto-regen no
      remini $mon($4) Skills Regen
      msg $chan Auto-Regen for $4 is now 11" $readini($mon($4), Status, auto-Regen) "
    }
  }
  if ($3 == npc) && ($exists($npc($4)) == $true) {
    var %autoregen $readini($npc($4), Status, auto-Regen)
    if (%autoregen == $null) || (%autoregen == no) {
      writeini $npc($4) Status auto-regen yes
      writeini $npc($4) Skills Regen $rand(1,20)
      msg $chan Auto-Regen for $4 is now 11" $readini($npc($4), Status, auto-Regen) "
      halt
    }
    if (%autoregen == $null) || (%autoregen == yes) {
      writeini $npc($4) Status auto-regen no
      remini $npc($4) Skills Regen
      msg $chan Auto-Regen for $4 is now 11" $readini($npc($4), Status, auto-Regen) "
    }
  }
}

on 50:text:!set EnableGremlins *:#: {
  set %check $3
  if (%check == true) || (%check == false) {
    /writeini system.dat system EnableGremlins $3
    msg $chan The EnableGremlins is set to: 11 " $+ $3 $+"
  }
  if (%check isnum) { msg $chan 4Error: Please set true or false for EnableGremlins }
}

on 50:text:!set EnableFoodOnOthers *:#: {
  set %check $3
  if (%check == true) || (%check == false) {
    /writeini system.dat system EnableFoodOnOthers $3
    msg $chan The EnableFoodOnOthers is set to: 11 " $+ $3 $+"
  }
  if (%check isnum) { msg $chan 4Error: Please set true or false for EnableFoodOnOthers }
}

on 50:text:!set EnableDinosaurs *:#: {
  set %check $3
  if (%check == true) || (%check == false) {
    /writeini system.dat system EnableDinosaurs $3
    msg $chan The EnableDinosaurs is set to: 11 " $+ $3 $+"
  }
  if (%check isnum) { msg $chan 4Error: Please set true or false for EnableDinosaurs }
}

on 50:text:!set TimeBetweenSave*:#: {
  if ($3 !Isnum) { msg $chan 4Error: Please set a number for the TimeBetweenSave }
  /writeini system.dat system TimeBetweenSave $3
  msg $chan The TimeBetweenSave is set to: 11 " $+ $3 $+ s"
}

on 50:text:!set TimeBetweenSaveReload*:#: {
  if ($3 !Isnum) { msg $chan 4Error: Please set a number for the TimeBetweenSaveReload }
  /writeini system.dat system TimeBetweenSaveReload $3
  msg $chan The TimeBetweenSaveReload is set to: 11 " $+ $3 $+ s"
}

on 50:text:!set RedChestBase *:#: {
  if ($3 !Isnum) && ($4 !isnum) { msg $chan 4Error: Please set a number for the TimeBetweenSaveReload }
  var %num1 $3
  var %num2 $4
  /writeini system.dat system RedChestBase $chr(36) $+ rand( $+ %num1 $+ , $+ %num2 $+ )
  msg $chan The RedChestBase set random from: 11 " $+ %num1 to %num2 $+ "
}

on 50:text:!set ChestTime*:#: {
  if ($3 !Isnum) { msg $chan 4Error: Please set a number for the ChestTime }
  /writeini system.dat system ChestTime $3
  msg $chan The ChestTime is set to: 11 " $+ $3 $+ s"
}

on 50:text:!set WheelGameTime*:#: {
  if ($3 !Isnum) { msg $chan 4Error: Please set a number for the WheelGameTime }
  /writeini system.dat system WheelGameTime $3
  msg $chan The WheelGameTime for Players is set to: 11 " $+ $3 $+ s"
}

on 50:text:!set MaxGauntletOrbReward*:#: {
  if ($3 !Isnum) { msg $chan 4Error: Please set a number for the MaxGauntletOrbReward }
  /writeini system.dat system MaxGauntletOrbReward $3
  msg $chan The MaxGauntletOrbReward for Players is set to: 11 " $+ $3 $+ "
}

on 50:text:!set system maxHP*:#: {
  if ($4 !Isnum) { msg $chan 4Error: Please set a number for the MaxHP }
  /writeini system.dat system maxHP $4
  msg $chan The Max HP for Players is set to: 11 " $+ $4 $+ "
}

on 50:text:!set system maxTP*:#: {
  if ($4 !Isnum) { msg $chan 4Error: Please set a number for the MaxTP }
  /writeini system.dat system maxTP $4
  msg $chan The Max HP for Players is set to: 11 " $+ $4 $+ "
}

on 50:text:!set system TimeToIdle*:#: {
  if ($4 !Isnum) { msg $chan 4Error: Please set a number for the Timer }
  /writeini system.dat system TimeToIdle $4
  msg $chan The TimeToIdle is set to: 11 " $+ $4 $+ sec "
}

on 50:text:!set Skill * Cooldown *:#: {
  if ($5 !Isnum) { msg $chan 4Error: Please set a number for the Cooldown }
  /writeini $dbfile(skills.db) $3 Cooldown $5
  msg $chan The Cooldown for Skill 11 " $+ $3 $+ " was set to 11 " $+ $5 $+ " turns
}

on 50:text:!set Skill OrbHunterAmount *:#: {
  if ($4 !Isnum) { msg $chan 4Error: Please set a number for the Amount }
  /writeini $dbfile(skills.db) OrbHunter Amount $4
  msg $chan The Amount for Skill 11 " $+ $3 $+ " was set to 11 " $+ $5 * SkillLevel $+ "
}

on 50:text:!set * streak *:#: {
  var %mon.name $3 $+ .char
  if ($2 == Boss) {
    if ($exists($mircdir $+ bosses\ $+ %mon.name) == $false) { msg $chan 4Error: Boss $3 dont exist }
    if ($exists($mircdir $+ bosses\ $+ %mon.name) == $true) && ($5 !isnum) { msg $chan 4Error: Please use a number for the Streak }
    if ($exists($mircdir $+ bosses\ $+ %mon.name) == $true) && ($5 isnum) {
      writeini $mircdir $+ bosses\ $+ %mon.name Info Streak $5
      /msg $chan The Streak for Boss $3 was changed to $5
    }
  }
  if ($2 == Monster) {
    if ($exists($mircdir $+ monsters\ $+ %mon.name) == $false) { msg $chan 4Error: Monster $3 dont exist }
    if ($exists($mircdir $+ monsters\ $+ %mon.name) == $true) && ($5 !isnum) { msg $chan 4Error: Please use a number for the Streak }
    if ($exists($mircdir $+ monsters\ $+ %mon.name) == $true) && ($5 isnum) {
      writeini $mircdir $+ monsters\ $+ %mon.name Info Streak $5
      /msg $chan The Streak for Monster $3 was changed to $5
    }
  }
}

on 50:text:!set * StreakMax *:#: {
  var %mon.name $3 $+ .char
  if ($2 == Boss) {
    if ($exists($mircdir $+ bosses\ $+ %mon.name) == $false) { msg $chan 4Error: Boss $3 dont exist }
    if ($exists($mircdir $+ bosses\ $+ %mon.name) == $true) && ($5 !isnum) { msg $chan 4Error: Please use a number for the Streak }
    if ($exists($mircdir $+ bosses\ $+ %mon.name) == $true) && ($5 isnum) {
      writeini $mircdir $+ bosses\ $+ %mon.name Info StreakMax $5
      /msg $chan The StreakMax for Boss $3 was changed to $5
    }
  }
  if ($2 == Monster) {
    if ($exists($mircdir $+ monsters\ $+ %mon.name) == $false) { msg $chan 4Error: Monster $3 dont exist }
    if ($exists($mircdir $+ monsters\ $+ %mon.name) == $true) && ($5 !isnum) { msg $chan 4Error: Please use a number for the Streak }
    if ($exists($mircdir $+ monsters\ $+ %mon.name) == $true) && ($5 isnum) {
      writeini $mircdir $+ monsters\ $+ %mon.name Info StreakMax $5
      /msg $chan The StreakMax for Monster $3 was changed to $5
    }
  }
}

on 50:text:!show chest content*:*: {
  var %chestcolor $4
  var %lines 1
  var %chestlines $lines($lstfile(chest_ $+ %chestcolor $+ .lst))
  if ($exists($lstfile(chest_ $+ %chestcolor $+ .lst)) == $false) { msg $nick sorry chest %chestcolor does not exist }
  while (%lines <= %chestlines) {
    var %item $read($lstfile(chest_ $+ %chestcolor $+ .lst), l, %lines)
    /write -l $+ %lines chestcontent.txt 3Item: 7 %item
    inc %lines 1
  }
  if (%lines >= %chestlines) { play $nick chestcontent.txt | /timerdelete1 1 30 /remove chestcontent.txt }
}

on 50:text:!change chest content*:*: {
  var %chestcolor $4
  set %existitem $readini($dbfile(items.db), $5, Cost)
  set %existcontent $5
  set %existcontentitem $read($lstfile(chest_ $+ %chestcolor $+ .lst), w, * $+ %existcontent $+ *)
  if ($exists($lstfile(chest_ $+ %chestcolor $+ .lst)) == $false) { msg $nick sorry chest %chestcolor does not exist }
  if ($exists($lstfile(chest_ $+ %chestcolor $+ .lst)) == $true) && (%existitem == $null) { msg $nick sorry but the item $5 does not exist and cant be added }
  if ($exists($lstfile(chest_ $+ %chestcolor $+ .lst)) == $true) && (%existitem != $null) && (%existcontent isin %existcontentitem) { msg $nick sorry but the item %existcontent already exist in the %chestcolor colord chest and cant be added }
  if ($exists($lstfile(chest_ $+ %chestcolor $+ .lst)) == $true) && (%existitem != $null) && (%existcontent !isin %existcontentitem) {
    write $lstfile(chest_ $+ %chestcolor $+ .lst) $5
    msg $nick Chestcontent 7 $5  added to the 10 %chestcolor  chest.
  }
}
