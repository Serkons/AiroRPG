on 3:TEXT:@create mon *:*: {
  var %mon.name $3 $+ .char
  if ($exists($mircdir $+ Monsters\ $+ %mon.name) == $true) { msg $nick Sorry $nick the Monster $remove(%mon.name,.char) already exists. | msg $nick please choose a another name  }
  set %create.mon. [ $+ [ $nick ] ] on
  msg $nick The Monster creation phase has begun. Now i has created a temp monfile with default values. You can edit this file by following my instruction.
  msg $nick You can finish the creation process by typing @upload mon name
  .copy $mircdir $+ Monsters\to_make\new_mon.char $mircdir $+ Monsters\to_make\ $+ %mon.name
  writeini $mircdir $+ Monsters\to_make\ $+ %mon.name BaseStats Name $replace($3,_, $chr(32))

  var %basestats.hp $readini $mircdir $+ Monsters\to_make\ $+ %mon.name BaseStats HP
  var %basestats.tp $readini $mircdir $+ Monsters\to_make\ $+ %mon.name BaseStats TP
  var %basestats.str $readini $mircdir $+ Monsters\to_make\ $+ %mon.name BaseStats Str
  var %basestats.def $readini $mircdir $+ Monsters\to_make\ $+ %mon.name BaseStats Def
  var %basestats.int $readini $mircdir $+ Monsters\to_make\ $+ %mon.name BaseStats Int
  var %basestats.spd $readini $mircdir $+ Monsters\to_make\ $+ %mon.name BaseStats Spd
  var %basestats.name $readini $mircdir $+ Monsters\to_make\ $+ %mon.name BaseStats Name
  var %basestats.ig $readini $mircdir $+ Monsters\to_make\ $+ %mon.name BaseStats IgnitionGauge

  var %battle.status $readini $mircdir $+ Monsters\to_make\ $+ %mon.name Battle Status
  var %desc $readini $mircdir $+ Monsters\to_make\ $+ %mon.name Descriptions Char
  var %drops $readini $mircdir $+ Monsters\to_make\ $+ %mon.name Stuff Drops
  var %monster.type $readini $mircdir $+ Monsters\to_make\ $+ %mon.name Monster Type
  var %tech.lern $readini $mircdir $+ Monsters\to_make\ $+ %mon.name Monster TechLearn
  var %Size $readini $mircdir $+ Monsters\to_make\ $+ %mon.name Monster Size
  var %Elite $readini $mircdir $+ Monsters\to_make\ $+ %mon.name Monster Elite
  var %SuperEl $readini $mircdir $+ Monsters\to_make\ $+ %mon.name Monster SuperElite
  var %Ghost $readini $mircdir $+ Monsters\to_make\ $+ %mon.name Monster Ghost

  var %weapon $readini $mircdir $+ Monsters\to_make\ $+ %mon.name Weapons Equipped
  var %weaponlevel $readini $mircdir $+ Monsters\to_make\ $+ %mon.name Weapons %weapon

  ;var %eq,head $readini $mircdir $+ Monsters\to_make\ $+ %mon.name Equipment Head
  ;var %eq,Body $readini $mircdir $+ Monsters\to_make\ $+ %mon.name Equipment Body
  ;var %eq,Hand $readini $mircdir $+ Monsters\to_make\ $+ %mon.name Equipment Hand
  :var %eq,Legs $readini $mircdir $+ Monsters\to_make\ $+ %mon.name Equipment Legs
  ;var %eq,Feets $readini $mircdir $+ Monsters\to_make\ $+ %mon.name Equipment Feets
  ;var %eq,ac $readini $mircdir $+ Monsters\to_make\ $+ %mon.name Equipment Accessory
  ;var %eq,ac2 $readini $mircdir $+ Monsters\to_make\ $+ %mon.name Equipment Accessory2

  var %nat.arm $readini $mircdir $+ Monsters\to_make\ $+ %mon.name NaturalArmor Name
  var %nat,arm.cur $readini $mircdir $+ Monsters\to_make\ $+ %mon.name NaturalArmor Current
  var %nat.arm.max $readini $mircdir $+ Monsters\to_make\ $+ %mon.name NaturalArmor Max

  msg $nick here is the default $3
  msg $nick 3BaseStats [[ Name: 7 %basestats.name 3 HP: 7 %basestats.hp 3 TP: 7 %basestats.tp 3 DEF: 7 %basestats.def 3 INT: 7 %basestats.int 3 SPD: 7 %basestats.spd 3 IG: 7 %basestats.ig 3 Status:7 %battle.status 3 ]]
  msg $nick 3Monsterdescription: 7 %desc
  msg $nick 3Drops: 7 %drops
  msg $nick 3Monster Infos:  Type: $iif(%monster.type != $null, 7 %monster.type3 , 7none3) Size: $iif(%Size != $null, 7 %Size3 , 7none3) TechLearn: $iif(%Tech.learn != $null, 7 %tech.learn3 , 7none3) Elite: $iif(%Elite != $null, 7 %monster.type3 , 7none3) SuperElite: $iif(%monster.type != $null, 7 %SuperEl3 , 7none3) Ghost: $iif(%monster.type != $null, 7 %Ghost3 , 7none3) 
  msg $nick 3Monsterweapon and Level: 7 %weapon 3 Level: 7 %weaponlevel
  ;msg $nick 3Armor: HEAD: $iif(%eq.head != $null, 7 %eq.head3 , 7none3) BODY: $iif(%eq.body != $null, 7 %eq.body3 , 7none3) HAND: $iif(%eq.hand != $null, 7 %eq.hand3 , 7none3) LEGS: $iif(%eq.legs != $null, 7 %eq.legs3 , 7none3) FEETS: $iif(%eq.feets != $null, 7 %eq.feets3 , 7none3) ACCESSORY: $iif(%eq.ac != $null, 7 %eq.ac3 , 7none3) ACCESSORY2: $iif(%eq.ac2 != $null, 7 %eq.ac23 , 7none3)
  timer1 1 1 msg $nick 3NaturalArmor: Name: $iif(%nat.arm != $null, 7 %nat.arm 3 , 7none3) 3 Current: $iif(%nat.cur != $null, 7 %nat.cur3 , 7none3) 3Max: $iif(%nat.max != $null, 7 %nat.max3 , 7none3)
  timer2 1 3 msg $nick if this value is not okay you can edit this please following the step by step setup now.  Step 1 is setting up the own Basestats so write now the following command:
  timer3 1 7 msg $nick @setup monname basestats num1 num2 num3 num4 num5 num6 num7
  timer4 1 9 msg $nick Example: 7@setup Tokka1 BaseStats 400 10 5 8 5 12 103 - So the Monster has the following Stats: 7 400 HP 10 TP 5 STR 8 DEF 5 INT 12 SPD Name: Tokka2 Status: Active
}

on 3:text:@setup * basestats *: *: {
  if (%create.mon. [ $+ [ $nick ] ] == on) {
    if ($4 !isnum) { msg $nick Error: You can only use numbers for the basestats  }
    var %mon.name $2 $+ .char

    writeini $mircdir $+ Monsters\to_make\ $+ %mon.name BaseStats HP $4
    writeini $mircdir $+ Monsters\to_make\ $+ %mon.name BaseStats TP $5
    writeini $mircdir $+ Monsters\to_make\ $+ %mon.name BaseStats STR $6
    writeini $mircdir $+ Monsters\to_make\ $+ %mon.name BaseStats DEF $7
    writeini $mircdir $+ Monsters\to_make\ $+ %mon.name BaseStats INT $8
    writeini $mircdir $+ Monsters\to_make\ $+ %mon.name BaseStats SPD $9
    writeini $mircdir $+ Monsters\to_make\ $+ %mon.name BaseStats IgnitionGauge $10
    writeini $mircdir $+ Monsters\to_make\ $+ %mon.name BaseStats Name $replace($2,_, $chr(32))

    writeini $mircdir $+ Monsters\to_make\ $+ %mon.name Batte HP $4
    writeini $mircdir $+ Monsters\to_make\ $+ %mon.name Batte TP $5
    writeini $mircdir $+ Monsters\to_make\ $+ %mon.name Batte STR $6
    writeini $mircdir $+ Monsters\to_make\ $+ %mon.name Batte DEF $7
    writeini $mircdir $+ Monsters\to_make\ $+ %mon.name Batte INT $8
    writeini $mircdir $+ Monsters\to_make\ $+ %mon.name Batte SPD $9
    writeini $mircdir $+ Monsters\to_make\ $+ %mon.name Batte IgnitionGauge $10
    writeini $mircdir $+ Monsters\to_make\ $+ %mon.name Batte Name $replace($3,_, $chr(32))

    msg $nick Custom Basestats for $2 are written. Lets go to the next step is setting up a monsterdescription.
    msg $nick The Description is the Info about the Monster before a battle begins. To setup write:
    msg $nick 7@setup monname desc text 3- Example: 7@setup tokka2 desc Is A small turtle
  }
}

on 3:text:@setup * desc *: *: {
  if (%create.mon. [ $+ [ $nick ] ] == on) {
    var %mon.name $2 $+ .char
    writeini $mircdir $+ Monsters\to_make\ $+ %mon.name Descriptions Char $4-
    msg $nick Monsterdescription: 11" $4- " was successfully setting up. 
    msg $nick the next step is to setup a 4DeathMessage when the monster dies.
    msg $nick to do this write 7 @setup monname deathmessage text
  }
}

on 3:text:@setup * deathmessage *: *: {
  if (%create.mon. [ $+ [ $nick ] ] == on) {
    var %mon.name $2 $+ .char
    writeini $mircdir $+ Monsters\to_make\ $+ %mon.name Descriptions DeathMessage $4-
    msg $nick The Deathmessage: 11" $4- " was successfully setting up. 
    msg $nick the next step is to setup 4Some Drops when the monster dies.
    msg $nick to do this write 7 @setup monname drops item
    msg $nick be sure that the item exists check it via !info item itemname
  }
}

on 3:text:@setup * drops *: *: {
  if (%create.mon. [ $+ [ $nick ] ] == on) {
    var %mon.name $2 $+ .char
    var %item $4-
    writeini $mircdir $+ Monsters\to_make\ $+ %mon.name Stuff Drops %item
    msg $nick The drops for $2 are the following: 11" $replace(%item,., $chr(32)) "
    msg $nick the next step is to setup a stagger value. First you can enable or disable this feature by typing: 7@setup monname CanStagger yes/no
    msg $nick If you set to yes you must define an stagger amount by typing 7@Setup monname StaggerAmount 7num1 num2
    msg $nick a Staggered Monster can not do anything for 1 turn.
  }
}

on 3:text:@setup * CanStagger *: *: {
  if (%create.mon. [ $+ [ $nick ] ] == on) {
    var %mon.name $2 $+ .char
    writeini $mircdir $+ Monsters\to_make\ $+ %mon.name Info CanStagger $4
    if ($4 == yes)  { msg $nick You enable the 4Stagger Feature for $2. Now you must define an amount by typing 7@Setup monname StaggerAmount 7num1 num2  }
    if ($4 == no)   { msg $nick You disabled the 4Stagger Feature for $2. You don't need to setup an stagger amount. Now the next step is you must setup the Rage value by typing 7@setup monname Rage Ignore | msg $nick If The Rage Mode is set to Ignore the monster get no boosts if darkness occurs. }
  }
}

on 3:text:@setup * StaggerAmount *: *: {
  if (%create.mon. [ $+ [ $nick ] ] == on) {
    var %mon.name $2 $+ .char
    var %num1 $4
    var %num2 $5
    writeini $mircdir $+ Monsters\to_make\ $+ %mon.name Info StaggerAmount $rand(%num1,%num2)
    msg $nick Now the next step is you can setup the Rage value its Optional by typing 7@setup monname Rage Ignore | msg $nick If The Rage Mode is set to Ignore the monster get no boosts if darkness occurs. By Default Rage Value is commented.
    msg $nick When darkness occurs and Rage is set to ignore the monster $2 will not be boosted.
    msg $nick next and the first important setup is to define which ki the monster should be have called 11"ai_type"
    msg $nick Valid types are:
    msg $nick -> 4defender - This AI type will do nothing but defend each round (think Orb Fountain or Lost Soul)
    msg $nick -> 4berserker - This AI type will attack anybody also his own allies.
    msg $nick -> 4paytoattack - This AI type will not take action in battle unless it has been paid (given red orbs). This AI type only works on NPCs as monsters cannot give items to another monster.
    msg $nick -> 4Portal - This AI type can summon every turn another monster to the battlefield
    msg $nick -> 4Healer - This AI type will only use healtechs on his allies every turn.
    msg $nick -> 4default - This AI type will define the monster as an normal monster.
    msg $nick leave this value black to define a normal monster
    msg $nick to set a type now write: 7@setup monname ai_type type (See list) 
  }
}
on 3:text:@setup * Rage *: *: {
  if (%create.mon. [ $+ [ $nick ] ] == on) {
    var %mon.name $2 $+ .char
    if ($4 == Ignore) { 
      writeini $mircdir $+ Monsters\to_make\ $+ %mon.name Info Rage $4 
      msg $nick When darkness occurs and Rage is set to ignore the monster $2 will not be boosted.
      msg $nick next and the first important setup is to define which ki the monster should be have called 11"ai_type"
      msg $nick Valid types are:
      msg $nick -> 4defender - This AI type will do nothing but defend each round (think Orb Fountain or Lost Soul)
      msg $nick -> 4berserker - This AI type will attack anybody also his own allies.
      msg $nick -> 4paytoattack - This AI type will not take action in battle unless it has been paid (given red orbs). This AI type only works on NPCs as monsters cannot give items to another monster.
      msg $nick -> 4Portal - This AI type can summon every turn another monster to the battlefield
      msg $nick -> 4Healer - This AI type will only use healtechs on his allies every turn.
      msg $nick leave this value black to define a normal monster
      msg $nick -> 4default - This AI type will define the monster as an normal monster.
      msg $nick to set a type now write: 7@setup monname ai_type type (See list)
    }
    if ($4 == default) { msg $nick the standard ragemode is enabled }
  }
}

on 3:text:@setup * ai_type *: *: {
  if (%create.mon. [ $+ [ $nick ] ] == on) {
    var %mon.name $2 $+ .char
    var %type $4
    if (%type == defender) { msg $nick Now you set the ai to 4 %type - The Monster $2 does nothing he also stands still | writeini $mircdir $+ Monsters\to_make\ $+ %mon.name Info ai_type $4 }
    if (%type == berserker) { msg $nick Now you set the ai to 4 %type - The Monster $2 will also can attack allies and other things | writeini $mircdir $+ Monsters\to_make\ $+ %mon.name Info ai_type $4 }
    if (%type == paytoattack) && ($readini($mircdir $+ Monsters\to_make\ $+ %mon.name Info Flag == npc) { msg $nick Now you set the ai to 4 %type - for NPC $2 to do anything when you give $2 some orbs | writeini $mircdir $+ Monsters\to_make\ $+ %mon.name Info ai_type $4 }
    if (%type == Portal) { msg $nick Now you set the ai to 4 %type - The Monster $2 can now summon other monsters to the battlefield | writeini $mircdir $+ Monsters\to_make\ $+ %mon.name Info ai_type $4 }
    if (%type == Healer) { msg $nick Now you set the ai to 4 %type - The Monster $2 will only use healtechs for its allies | writeini $mircdir $+ Monsters\to_make\ $+ %mon.name Info ai_type $4 }
    if (%type == default) { msg $nick Now you set the ai to 4 %type - The Monster will act as normal monster }
    /timer1 1 5 msg $nick the next thing to setup is the Level when the Monster should be generated called 11"streak and streakmax"
    /timer2 1 8 msg $nick to setup this you can define one value by typing 7@setup monname streak num1 or 7@setup monname streakmax num1
  }
}

on 3:text:@setup * streak *: *: {
  if (%create.mon. [ $+ [ $nick ] ] == on) {
    var %mon.name $2 $+ .char
    writeini $mircdir $+ Monsters\to_make\ $+ %mon.name Info Streak $4
    msg $nick Now the Monster $2 will be generated at minimum streak $4
    msg $nick the next setup is to define if the monster canflee out of battles
    msg $nick you can setup this by typing 7@setup monname canflee true/false
  }
}

on 3:text:@setup * canflee *: *: {
  if (%create.mon. [ $+ [ $nick ] ] == on) {
    var %mon.name $2 $+ .char
    writeini $mircdir $+ Monsters\to_make\ $+ %mon.name Info canflee $4
    msg $nick Now the Monster $2 can flee out of the battles.
    msg $nick the next setup is to define if the monster can use items inside a battle
    msg $nick you can setup this by typing 7@setup monname CanUseItems true/false
  }
}

on 3:text:@setup * streakmax *: *: {
  if (%create.mon. [ $+ [ $nick ] ] == on) {
    var %mon.name $2 $+ .char
    writeini $mircdir $+ Monsters\to_make\ $+ %mon.name Info StreakMax $4
    msg $nick Now the Monster $2 will be generated to the max streak at $4
    msg $nick the next setup is to define if the monster can use items inside a battle
    msg $nick you can setup this by typing 7@setup monname CanUseItems true/false
  }
}

on 3:text:@setup * CanUseItems *: *: {
  if (%create.mon. [ $+ [ $nick ] ] == on) {
    var %mon.name $2 $+ .char
    writeini $mircdir $+ Monsters\to_make\ $+ %mon.name Info CanUseItems $4
    msg $nick now the Monster $2 can now use items in Battles.
    msg $nick the next setup is to definine wich monster can be generated after this monster dies
    msg $nick this is an optional setting you dont need this if you dont want to spawn anothe monster after the main is died.
    msg $nick You can set it by typing this: 7@setup monname spawnafterdeath monname2
    msg $nick Another Optional feature to setup is the biom who generated the monster
    msg $nick to do this write the following command: 7@setup monname biom battlefieldname
    msg $nick the next important thing you must setup is to ignore a skill called drainsamba if you want
    msg $nick you can setup this by typing 7@setup monname IgnoreDrain true/false
  }
}

on 3:text:@setup * spawnafterdeath *: *: {
  if (%create.mon. [ $+ [ $nick ] ] == on) {
    var %mon.name $2 $+ .char
    writeini $mircdir $+ Monsters\to_make\ $+ %mon.name Info spawnafterdeath $4
    msg $nick now the monster $4 should be generated after 11" $2 " is died.
    msg $nick Another Optional feature to setup is the biom who generated the monster
    msg $nick to do this write the following command: 7@setup monname biom battlefieldname
  }
}

on 3:text:@setup * biom *: *: {
  if (%create.mon. [ $+ [ $nick ] ] == on) {
    var %mon.name $2 $+ .char
    writeini $mircdir $+ Monsters\to_make\ $+ %mon.name Info biome $4-
    msg $nick now the monster $2 will only generated at Biom: 11 $4-
    msg $nick the next important thing you must setup is to ignore a skill called drainsamba if you want
    msg $nick you can setup this by typing 7@setup monname IgnoreDrain true/false
  }
}

on 3:text:@setup * IgnoreDrain *: *: {
  if (%create.mon. [ $+ [ $nick ] ] == on) {
    var %mon.name $2 $+ .char
    writeini $mircdir $+ Monsters\to_make\ $+ %mon.name Info IgnoreDrain $4
    msg $nick Now the Skill !drainsamba takes no effekt by attacking $2
    msg $nick the next setting is optional you can setup a specific moonphase to generate the monster
    msg $nick so type 7@setup monname moonphase phase
    msg $nick Valid Phases are: Full Moon or Crescent Moon or Gibbous Moon or New Moon or Quarter Moon or Blood Moon (with the spaces)
  }
}

on 3:text:@setup * moonphase *: *: {
  if (%create.mon. [ $+ [ $nick ] ] == on) {
    var %mon.name $2 $+ .char
    writeini $mircdir $+ Monsters\to_make\ $+ %mon.name Info moonphase $4-
    msg $nick the monster $2 will only appear at 11 $4-
    msg $nick the next setting is optional you can setup a specific daytime to generate the monster
    msg $nick so type 7@setup monname daytime timeofday
    msg $nick Valid Times are: Morning, Noon, Evening and Night.
    msg $nick next setup is to define can the monster taunt others or not
    msg $nick to do this write: 7@setup monname CanTaunt true/false
  }
}

on 3:text:@setup * daytime *: *: {
  if (%create.mon. [ $+ [ $nick ] ] == on) {
    var %mon.name $2 $+ .char
    writeini $mircdir $+ Monsters\to_make\ $+ %mon.name Info TimeOfDay $4-
    msg $nick the monster $2 will only appear at 11 $4-
    msg $nick next setup is to define can the monster taunt others or not
    msg $nick to do this write: 7@setup monname CanTaunt true/false
  }
}

on 3:text:@setup * CanTaunt *: *: {
  if (%create.mon. [ $+ [ $nick ] ] == on) {
    var %mon.name $2 $+ .char
    writeini $mircdir $+ Monsters\to_make\ $+ %mon.name Info CanTaunt $4
    msg $nick now the monster $2 can now taunting others if it set to true
    msg $nick now setup a guardian to protect the monster if the guardian is in the battle $2 will take 0 damage.
    msg $nick to set a guardian write 7@setup monnname guardian monname2
  }
}

on 3:text:@setup * guardian *: *: {
  if (%create.mon. [ $+ [ $nick ] ] == on) {
    var %mon.name $2 $+ .char
    if ($3 != style) {
      writeini $mircdir $+ Monsters\to_make\ $+ %mon.name Info guardian $4-
      msg $nick now the monster $2 has the guardians $4-
      msg $nick next setup can be the JustReleaseDefense - its an Optional Setting to block a percentage amount of damage from the skill !justrelease
      msg $nick to setup write: 7@setup monname JustReleaseDefense num%
    }
  }
}

on 3:text:@setup * JustReleaseDefense *: *: {
  if (%create.mon. [ $+ [ $nick ] ] == on) {
    var %mon.name $2 $+ .char
    writeini $mircdir $+ Monsters\to_make\ $+ %mon.name Info JustReleaseDefense $4-
    msg $nick the monster $2 will now block $4 $+ % of damage from !justrelease
    msg $nick the next setting is to define 4HurtByTaunt - This is a Special Value when taunting this monster it will take damage
    msg $nick to setup this write 7@setup monname HurtByTaunt true/false
  }
}

on 3:text:@setup * HurtByTaunt *: *: {
  if (%create.mon. [ $+ [ $nick ] ] == on) {
    var %mon.name $2 $+ .char
    writeini $mircdir $+ Monsters\to_make\ $+ %mon.name Info HurtByTaunt $4- 
    msg $nick now the monster $2 will now hurt by taunting 
    msg $nick the next setting is to define 4HealByTaut - This is a Special Value when taunting this monster it will be healed.
    msg $nick to do this write 7@setup monname HealByTaunt true/false
  }
}

on 3:text:@setup * HealByTaunt *: *: {
  if (%create.mon. [ $+ [ $nick ] ] == on) {
    var %mon.name $2 $+ .char
    writeini $mircdir $+ Monsters\to_make\ $+ %mon.name Info HealByTaunt $4- 
    msg $nick now the monster $2 will now heal by taunting 
    msg $nick the next setting is to define 4IgnorePresident - This is a Special Value if you dont want that the monster spawn at rescue the president event.
    msg $nick to do this write 7@setup monname IgnorePresident true/false
  }
}

on 3:text:@setup * IgnorePresident *: *: {
  if (%create.mon. [ $+ [ $nick ] ] == on) {
    var %mon.name $2 $+ .char
    writeini $mircdir $+ Monsters\to_make\ $+ %mon.name Info IgnorePresident $4-
    msg $nick now the monster $2 will now ignore the president event if it set to true
    msg $nick the next setting is to define 4IgnoreOutpost - This is a Special Value if you dont want that the monster spawn at rescue the Outpost event.
    msg $nick to do this write 7@setup monname IgnoreOutpost true/false
  }
} 

on 3:text:@setup * IgnoreOutpost *: *: {
  if (%create.mon. [ $+ [ $nick ] ] == on) {
    var %mon.name $2 $+ .char
    writeini $mircdir $+ Monsters\to_make\ $+ %mon.name Info IgnoreOutpost $4-
    msg $nick now the monster $2 will now ignore the outpost event if it set to true
    msg $nick next setup is the option 4ImmunToMagic - its only for boss monsters
    msg $nick to set this write @setup monname ImmunToMagic true
  }
} 

on 3:text:@setup * ImmunToMagic *: *: {
  if (%create.mon. [ $+ [ $nick ] ] == on) {
    var %mon.name $2 $+ .char
    writeini $mircdir $+ Monsters\to_make\ $+ %mon.name Info ImmunToMagic $4-
    msg $nick now the monster $2 will now be immune to magic when its true
    msg $nick next setup is the option 4DeathConditions - Its a Specialflage you can define by which action a monster can die.
    msg $nick if the monster is not killed by the called actions it will be auto revieve.
    msg $nick valid actions are: melee, magic, tech, item, renkei, status, magiceffect.
    msg $nick you can define multiple actions by putting a . between it. Example: melee.magic
    msg $nick so you should write 7@setup monname DeathConditions actions
  }
} 

on 3:text:@setup * DeathConditions *: *: {
  if (%create.mon. [ $+ [ $nick ] ] == on) {
    var %mon.name $2 $+ .char
    writeini $mircdir $+ Monsters\to_make\ $+ %mon.name Info DeathConditions $4-
    msg $nick now the monster $2 will now died by the following conditions: $4-
    msg $nick now you must setup the monster values called Type Size Elite etc.
    msg $nick to do this you must write:
    msg $nick 7@setup monname Monster Type (type)
    msg $nick 7@setup monname Monster Size small/medium/large
    msg $nick 7@setup monname Monster Elite true/false
    msg $nick 7@setup monname Monster SuperElite True/false
    msg $nick 7@setup monname Monster TechLearn true/false
    msg $nick 7@setup monname Monster Ghost true
  }
} 

on 3:text:@setup * Monster *: *: {
  if (%create.mon. [ $+ [ $nick ] ] == on) {
    var %mon.name $2 $+ .char
    if ($4 == Type)  { writeini $mircdir $+ Monsters\to_make\ $+ %mon.name Monster Type $5- | msg $nick You Set the Monstertype for $2 to 4 $5- }
    if ($4 == Size) && ($5 isin small/medium/large) { writeini $mircdir $+ Monsters\to_make\ $+ %mon.name Monster Size $5- | msg $nick You Set the Monstersize for $2 to 4 $5- }
    if ($4 == Elite) && ($5 == true) { writeini $mircdir $+ Monsters\to_make\ $+ %mon.name Monster Elite $5- | msg $nick You Set the Monster $2 to 4 $5- }
    if ($4 == SuperElite) && ($5 == true) { writeini $mircdir $+ Monsters\to_make\ $+ %mon.name Monster SuperElite $5- | msg $nick You Set the Monster $2 to 4 $5- }
    if ($4 == TechLearn) && ($5 == true) { writeini $mircdir $+ Monsters\to_make\ $+ %mon.name Monster TechLearn $5- | msg $nick You Set the TechLearn for $2 to 4 $5- }
    if ($4 == Ghost) && ($5 == true) { writeini $mircdir $+ Monsters\to_make\ $+ %mon.name Monster Ghost $5- | msg $nick You Set the Monster $2 to 4 $5- }
    msg $nick now you can setup a monsterweapon quickly by following the command Syntax:
    msg $nick 7@setup monname monweapon nameoftheweapon level var1 var2 var3 var4 var5 var6 var7 var8 var9 var10 var11 var12 var13 var14 var15 var16 var17 var18 var19 var20
    msg $nick each placeholder replaced an value see below
    /play $nick valuedec.txt  
  }
}

on 3:text:@setup * monweapon *: *: {
  if (%create.mon. [ $+ [ $nick ] ] == on) {
    var %mon.name $2 $+ .char
    var %monweapon2 $4
    var %weaponlevel $5
    var %chan $chan
    var %cost $6
    var %type $7
    var %info $8
    var %ab $9
    var %element $10
    var %hits $11
    var %basep $12
    var %upgr $13
    var %igdef $14
    var %hurtdef $15
    var %2hand $16
    var %encost $17
    var %canshi $18
    var %cancount $19
    var %sw $20
    var %lw $21
    var %AmReq $22
    var %AmAm $23
    var %Leg $24
    var %MinLev $25
    var %monweapon $read($dbfile(weapons.db), l, 68)
    if ($4 isin %monweapon) { msg $nick weapon $4 Already exists cannot create this }
    if ($4 !isin %monweapon) { 
      msg $nick creating weapon $4 
      var %monweapon3 $addtok(%monweapon, $4, 46)
      write -l68 $dbfile(weapons.db) %monweapon3
      writeini $mircdir $+ Monsters\to_make\ $+ %mon.name Weapons Equipped %monweapon2
      writeini $mircdir $+ Monsters\to_make\ $+ %mon.name Weapons %monweapon2 %weaponlevel
      remini $mircdir $+ Monsters\to_make\ $+ %mon.name Weapons monsterweaponname

      writeini $dbfile(weapons.db) %monweapon2 Cost %cost
      writeini $dbfile(weapons.db) %monweapon2 Type %Type
      writeini $dbfile(weapons.db) %monweapon2 Info $replace(%Info,_, $chr(32))
      writeini $dbfile(weapons.db) %monweapon2 Abilities %ab
      writeini $dbfile(weapons.db) %monweapon2 Element %element
      writeini $dbfile(weapons.db) %monweapon2 Hits %hits
      writeini $dbfile(weapons.db) %monweapon2 BasePower %basep
      writeini $dbfile(weapons.db) %monweapon2 Upgrade %upgr
      writeini $dbfile(weapons.db) %monweapon2 IgnoreDefense %igdef
      writeini $dbfile(weapons.db) %monweapon2 HurthEthereal %hurtdef
      writeini $dbfile(weapons.db) %monweapon2 2Handed %2hand
      writeini $dbfile(weapons.db) %monweapon2 EnergyCost %encost
      writeini $dbfile(weapons.db) %monweapon2 CanShieldReflect %canshi
      writeini $dbfile(weapons.db) %monweapon2 CanCounter %cancount
      writeini $dbfile(weapons.db) %monweapon2 SpecialWeapon %sw
      if (%lw != none) || (%lw != $null) { writeini $dbfile(weapons.db) %monweapon2 LinkedWeapon %lw }
      writeini $dbfile(weapons.db) %monweapon2 AmmoRequired %AmReq
      writeini $dbfile(weapons.db) %monweapon2 AmmoAmountNeeded %AmAm
      writeini $dbfile(weapons.db) %monweapon2 Legendary %Leg
      writeini $dbfile(weapons.db) %monweapon2 MinLevel %MinLev
      timer1 1 2 /msg $nick Weapon %monweapon2 successfull created.
      timer2 1 5 /msg $nick now you can setup some skills for your monster that can use in the battle
      timer3 1 8 /msg $nick so you must type 7@setup monname Skill Skillname Level
    }
  }
}
on 3:text:@setup * Skill *: *: {
  if (%create.mon. [ $+ [ $nick ] ] == on) {
    var %mon.name $2 $+ .char
    var %skillname $4
    var %skilllevel $5
    if (%skilllevel > $readini($dbfile(skills.db), %skillname, Max))   { msg $nick Sorry you cant setup this skill with this level please chose a lower value of the level }
    writeini $mircdir $+ Monsters\to_make\ $+ %mon.name Skills %skillname %skilllevel
    msg $nick You have successfully set up skill 11" %skillname "  and can now continue with the next step that would be the registering of 11"techniques" for the monster weapon
    msg $nick to do this write only 7@create techniques for weaponname techname1.techname2 i remember you it must the same that you setup by creating the weapon.
  }
}

on 3:text:@create techniques for *:*: {
  if (%create.mon. [ $+ [ $nick ] ] == on) {
    var %monweapon $read($dbfile(weapons.db), l, 68)
    var %technames $5-
    var %weaponname $4
    ;set %lines $lines($dbfile(techniques.db))
    :set %newline $calc(%lines + 2)
    if (%weaponname !isin %monweapon) { msg $nick weapon 4 %weaponname  does not  exists, í cant setup the techniques 4 %technames   }
    if (%weaponname isin %monweapon) {
      writeini $dbfile(techniques.db) Techs %weaponname %technames 
      msg $nick techniques for %weaponname are written now you must setup this.
      msg $nick to do this write the follwing comand syntax and replace the placeholders with data:
      msg $nick 7@setup technique monname weaponname techname var1 var2 var3 var4 var5 var6 var7 var8 var9 var10 var11 var12 var13 var14 var15 var16 var17 var18 var19
      var %nick $nick
      var %xfile techvalue
      $showfile(%xfile)
    }
  }
}

on 3:text:@setup Technique *: *: {
  if (%create.mon. [ $+ [ $nick ] ] == on) {
    var %monweapon $read($dbfile(weapons.db), l, 68)
    var %mon.name $3 $+ .char
    var %moweap $4
    var %mowpos $gettok(%monweapon,%moweap,46)
    var %monweapon2 $gettok(%monweapon,%mowpos,46)
    var %techname $5
    var %techlevel $6
    var %montech $read($mircdir $+ dbs\techniques.db, w, * $+ %moweap $+ *)
    if (%moweap != %monweapon2) { msg $nick Tech & Weapon doesnt exist }
    if (%moweap == %monweapon2) && (%techname isin %montech) {
      var %techlevel $6
      var %techtype $7
      var %techcost $8
      var %techtp $9
      var %techelement $10
      var %techhits $11
      var %techbasepower $12
      var %techmagic $13
      var %techstatustype $14
      var %techselfstatus $15
      var %TechIgnoreDefense $16
      var %TechHurthEthereal $17
      var %techEnergyCost $18
      var %techStat $19
      var %techrenkai $20
      var %TechDodge $21
      var %TechDestroyShadows $22
      var %TechDeathChance $23
      var %techSpell $24
      ; Writing the techniques in the new monfile with the level
      writeini $mircdir $+ Monsters\to_make\ $+ %mon.name Techniques %techname %techlevel
      ; Writing the New Technique in the db file and save it with the given data
      writeini $dbfile(techniques.db) %techname Type %techtype
      writeini $dbfile(techniques.db) %techname Cost %techcost
      writeini $dbfile(techniques.db) %techname TP %techtp
      writeini $dbfile(techniques.db) %techname Element %techelement
      writeini $dbfile(techniques.db) %techname Hits %techhits
      writeini $dbfile(techniques.db) %techname BasePower %techbasepower
      writeini $dbfile(techniques.db) %techname Magic %techmagic
      writeini $dbfile(techniques.db) %techname StatusType %techstatustype
      writeini $dbfile(techniques.db) %techname selfstatus %techselfstatus
      writeini $dbfile(techniques.db) %techname IgnoreDefense %techIgnoreDefense
      writeini $dbfile(techniques.db) %techname HurtEthereal %techHurthEthereal
      writeini $dbfile(techniques.db) %techname EnergyCost %techEnergyCost
      writeini $dbfile(techniques.db) %techname stat %techStat
      writeini $dbfile(techniques.db) %techname Renkei %techrenkai
      writeini $dbfile(techniques.db) %techname CanDodge %techDodge
      writeini $dbfile(techniques.db) %techname DestroyShadows %techDestroyShadows
      writeini $dbfile(techniques.db) %techname DeathChance %techDeathchance
      writeini $dbfile(techniques.db) %techname Spell %techSpell
      /msg $nick Techniques are done soon you need a desc for the technique to functional this
      /msg $nick so write 7@setup TechniqueDesc monname weaponname techname text
    }
  }
}


on 3:text:@setup TechniqueDesc *: *: {
  if (%create.mon. [ $+ [ $nick ] ] == on) {
    var %monweapon $read($dbfile(weapons.db), l, 68)
    var %mon.name $3 $+ .char
    var %moweap $4
    var %mowpos $gettok(%monweapon,%moweap,46)
    var %monweapon2 $gettok(%monweapon,%mowpos,46)
    var %techname $5
    var %techlevel $6
    var %montech $read($mircdir $+ dbs\techniques.db, w, * $+ %moweap $+ *)
    if (%moweap != %monweapon2) { msg $nick Tech & Weapon doesnt exist }
    if (%moweap == %monweapon2) && (%techname isin %montech) {
      writeini $dbfile(techniques.db) %techname Desc $6-
      timer1 1 3 /msg $nick Technique %techname successfully setted up.
      timer2 1 5 /msg $nick now you can setup a style that the monste can use with the level behind 
      timer3 1 5 /msg $nick so you can write this 7@setup monname style stylename level

    }
  }
}

on 3:text:@setup * style *: *: {
  if (%create.mon. [ $+ [ $nick ] ] == on) {
    var %mon.name $2 $+ .char
    var %stylename $4
    var %stylelevel $5
    if ($readini($dbfile(playerstyles.db), costs, %stylename) = $null) && (%stylelevel > 10) { msg $nick Sorry the Style does not exist please visit: https://game.igame-rpg.de/docu/index.php?title=Spieler_Styles }
    if ($readini($dbfile(playerstyles.db), costs, %stylename) != $null) && (%stylelevel >= 10) { msg $nick Sorry the Stylelevel is to high to add this style. }
    if ($readini($dbfile(playerstyles.db), costs, %stylename) != $null) && (%stylelevel <= 10) {
      writeini $mircdir $+ monsters\to_make\ $+ %mon.name Styles %stylename %stylelevel
      writeini $mircdir $+ monsters\to_make\ $+ %mon.name Styles Equipped %stylename
      msg $nick now you can setup a 11"NaturalArmor" if you want this.
      msg $nick a NaturalArmor is an Extra Protection again damage
      msg $nick You can do this by type 7@setup monname NaturalArmor Armorname Current(num) Max[Num)
      msg $nick Example: 7@Setup Testmonster NaturalArmor Kinshu_Noda_ni 500 500
      msg $nick NOTE: Please do not uses spaces by the Armorname replace it with _ it will be converted after sending the command.
    }
  }
}

on 3:text:@setup * NaturalArmor *: *: {
  if (%create.mon. [ $+ [ $nick ] ] == on) {
    var %mon.name $2 $+ .char
    var %armorname $replace($4,_, $chr(32))
    set %cur $5
    set %max $6
    if (%cur !isnum) && (%max !isnum) { msg $nick you must enter 2 numbers for current and max. try again }
    if (%cur isnum) && (%max isnum) {
      writeini $mircdir $+ monsters\to_make\ $+ %mon.name NaturalArmor Name %armorname
      writeini $mircdir $+ monsters\to_make\ $+ %mon.name NaturalArmor Current %cur
      writeini $mircdir $+ monsters\to_make\ $+ %mon.name NaturalArmor Max %max
      msg $nick Now you must setup the 11"Item_Amount"  if you setup the "CanUseItems" flag to true.
      msg $nick Note: Only Battle Items can use the Monster for canuseitems so be sure you setup it correcty
      msg $nick To do this write 7@setup monname usable-Items itemname amount
    }
  }
}

on 3:text:@setup * usable-items *: *: {
  if (%create.mon. [ $+ [ $nick ] ] == on) {
    var %mon.name $2 $+ .char
    set %uitem $4
    set %ubattle $read($txtfile(itembattle.txt), w, * $+ %uitem $+ *)
    if (%uitem == %ubattle) {
      var %iamo $5
      writeini $mircdir $+ monsters\to_make\ $+ %mon.name Item_Amount %uitem %iamo
      msg $nick now you can setup wich action the monster should do if its the monsters turn it is called 11"Rotations"
      msg $nick Valid actions: free, attack, tech, taunt, skill, flee, ignition, item, mech. - Note for Mech and Ignitions please ask a GameAdmin to add this in the monsterfile.
      msg $nick To add Rotations write it so: 7@setup monname Rotations num 
      msg $nick Example 7@setup Textmonster Rotations 10 - Than add the action by writing 7@add rotationaction monname num action
      msg $nick Note: Remember what you has setup for the current rotation for example you has setup (Current 10) than you can use number from 1-10 for the @add command
    }
    if (%uitem != %ubattle) && (%uitem != Arrow) { 
      msg $nick Item %uitem is not a battle item and cannot be used for the flag 11"canuseitems".
    }
    if (%uitem == Arrow) { /msg $nick This Item is an Ammo and was registered
      var %iamo $5
      writeini $mircdir $+ monsters\to_make\ $+ %mon.name Item_Amount %uitem %iamo
      msg $nick now you can setup wich action the monster should do if its the monsters turn it is called 11"Rotations"
      msg $nick Valid actions: free, attack, tech, taunt, skill, flee, ignition, item, mech. - Note for Mech and Ignitions please ask a GameAdmin to add this in the monsterfile.
      msg $nick To add Rotations write it so: 7@setup monname Rotations num 
      msg $nick Example 7@setup Textmonster Rotations 10 - Than add the action by writing 7@add rotationaction monname num action
      msg $nick Note: Remember what you has setup for the current rotation for example you has setup (Current 10) than you can use number from 1-10 for the @add command

    }

  }
}

on 3:text:@setup * Rotations *: *: {
  if (%create.mon. [ $+ [ $nick ] ] == on) {
    var %mon.name $2 $+ .char
    if ($4 !isnum) { /msg $nick Sorry please enter a num for the current rotations }
    writeini $mircdir $+ monsters\to_make\ $+ %mon.name Rotations Current $4
    msg $nick You has successfully setup $4 Rotations. You can also use numbers from 1 to $4 for the actions
    msg $nick Now you must add an action.
    msg $nick Valid actions: free, attack, tech, taunt, skill, flee, ignition, item, mech. - Note for Mech and Ignitions please ask a GameAdmin to add this in the monsterfile.
    msg $nick to do this write 7@add rotationaction monname num action
    msg $nick Example: 7@add rotationaction TestMonster 1 tech
    msg $nick Note: Remember what you has setup for the current rotation for example you has setup (Current 10) than you can use number from 1-10 for the @add command
  }
}


on 3:text:@add Rotationaction *: *: {
  if (%create.mon. [ $+ [ $nick ] ] == on) {
    var %mon.name $3 $+ .char
    var %rotnum $4
    var %action $5
    var %currentrot $readini($mircdir $+ monsters\to_make\ $+ %mon.name, Rotations, Current)
    if (%rotnum <= %currentrot) {
      writeini $mircdir $+ monsters\to_make\ $+ %mon.name Rotations %rotnum %action
      msg $nick successfully add Action %action with number %rotnum for the rotation of %mon.name
      $rotations($3)
      msg $nick now you has succesfully fullsetup your first monster now you has other options:
      msg $nick if you want to upload this monster so write 7@upload mon monstername
      msg $nick if you want to convert this monster into an npc so write 7@convert mon monname to npc text
      msg $nick if you want to convert this monster into an Boss so write 7@convert mon monname to Boss text
    }
    if (%rotnum >= %currentrot) {
      msg $nick sorry you are over the current rotations value of %currentrot. no more action can be added.
    }
  }
}

on 3:text:@upload monster *: *: {
  if (%create.mon. [ $+ [ $nick ] ] == on) {
    var %mon.name $3 $+ .char
    if ($exists($mircdir $+ monsters\to_make\ $+ %mon.name) == $false) { msg $nick sorry the monster $3 does not exists }
    if ($exists($mircdir $+ monsters\ $+ %mon.name) == $true) { msg $nick sorry the monster $3 already exists }
    var %uploadfile $mircdir $+ monsters\to_make\ $+ %mon.name
    var %monsterfolder $mircdir $+ monsters\
    .copy %uploadfile %monsterfolder $+ %mon.name
    timerrem1 1 5 .remove %uploadfile
    msg $nick Monster $3 Successfully uploaded and added to the game it should be generated soon.
    msg $nick if you Monster dont generate later in the game ask a GameAdmin Whats wrong.
    msg $nick Thank You for adding some stuff.
    timer1 1 2 /unset %create.mon. [ $+ [ $nick ] ] on
  }

}

on 3:text:@upload npc *: *: {
  if (%create.mon. [ $+ [ $nick ] ] == on) {
    set %npc.name $3 $+ .char
    if ($exists($mircdir $+ npcs\to_make\ $+ %npc.name) == $false) { msg $nick sorry the NPC $3 does not exists }
    if ($exists($mircdir $+ npcs\ $+ %npc.name) == $true) { msg $nick sorry the NPC $3 already exists }
    var %uploadfile2 $mircdir $+ npcs\to_make\ $+ %npc.name
    var %monsterfolder2 $mircdir $+ npcs\
    .copy %uploadfile2 %monsterfolder2 $+ %npc.name
    timerrem1 1 5 .remove %uploadfile2
    msg $nick NPC $3 Successfully uploaded and added to the game it should be generated soon.
    msg $nick if you NPC dont generate later in the game ask a GameAdmin Whats wrong.
    msg $nick Thank You for adding some stuff.
    timer1 1 2 /unset %create.mon. [ $+ [ $nick ] ] on
  }
  if (%create.mon. [ $+ [ $nick ] ] != on) {
    msg $nick no permission
  }
}

on 3:text:@upload boss *: *: {
  if (%create.mon. [ $+ [ $nick ] ] == on) {
    var %npc.name $3 $+ .char
    if ($exists($mircdir $+ bosses\to_make\ $+ %npc.name) == $false) { msg $nick sorry the NPC $3 does not exists }
    if ($exists($mircdir $+ bosses\ $+ %npc.name) == $true) { msg $nick sorry the NPC $3 already exists }
    var %uploadfile2 $mircdir $+ bosses\to_make\ $+ %npc.name
    var %monsterfolder2 $mircdir $+ bosses\
    .copy %uploadfile2 %monsterfolder2 $+ %npc.name
    timerrem1 1 5 .remove %uploadfile2
    msg $nick Boss $3 Successfully uploaded and added to the game it should be generated soon.
    msg $nick if you BOSS dont generate later in the game ask a GameAdmin Whats wrong.
    msg $nick Thank You for adding some stuff.
    timer1 1 2 /unset %create.mon. [ $+ [ $nick ] ] on
  }
  if (%create.mon. [ $+ [ $nick ] ] != on) {
    msg $nick no permission
  }
}

on 3:text:@convert mon * to *: *: {
  if (%create.mon. [ $+ [ $nick ] ] == on) {
    var %mon.name $3 $+ .char
    if ($exists($mircdir $+ monsters\to_make\ $+ %mon.name) == $false) { msg $nick sorry the monster $3 does not exists }
    if ($5 == npc) && ($6- != $null) {
      writeini $mircdir $+ monsters\to_make\ $+ %mon.name Info Flag NPC
      writeini $mircdir $+ monsters\to_make\ $+ %mon.name Descriptions npcQuote $6-
      var %convertfile $mircdir $+ monsters\to_make\ $+ %mon.name
      var %convertto $mircdir $+ npcs\to_make\
      .copy %convertfile %convertto $+ %mon.name
      .remove %convertfile
      msg $nick Monster $3 Successfully converted into an npc you can now upload it via 7@upload npc name.
    }
    if ($5 == Boss) && ($6- != $null) {
      writeini $mircdir $+ monsters\to_make\ $+ %mon.name Info Flag monster
      writeini $mircdir $+ monsters\to_make\ $+ %mon.name Descriptions BossQuote $6-
      var %convertfile $mircdir $+ monsters\to_make\ $+ %mon.name
      var %convertto $mircdir $+ bosses\to_make\
      .copy %convertfile %convertto $+ %mon.name
      .remove %convertfile
      msg $nick Monster $3 Successfully converted into an Boss you can now upload it via 7@upload boss name.
    }
  }
}

on 3:text:@check mon *:*: {
  if (%create.mon. [ $+ [ $nick ] ] == on) {
    var %mon.name $3 $+ .char
    if ($exists($mircdir $+ monsters\to_make\ $+ %mon.name) == $false) { msg $nick sorry the monster $3 does not exists | halt }
    var %basestats.hp $readini $mircdir $+ Monsters\to_make\ $+ %mon.name BaseStats HP
    var %basestats.tp $readini $mircdir $+ Monsters\to_make\ $+ %mon.name BaseStats TP
    var %basestats.str $readini $mircdir $+ Monsters\to_make\ $+ %mon.name BaseStats Str
    var %basestats.def $readini $mircdir $+ Monsters\to_make\ $+ %mon.name BaseStats Def
    var %basestats.int $readini $mircdir $+ Monsters\to_make\ $+ %mon.name BaseStats Int
    var %basestats.spd $readini $mircdir $+ Monsters\to_make\ $+ %mon.name BaseStats Spd
    var %basestats.name $readini $mircdir $+ Monsters\to_make\ $+ %mon.name BaseStats Name
    var %basestats.ig $readini $mircdir $+ Monsters\to_make\ $+ %mon.name BaseStats IgnitionGauge

    var %battle.status $readini $mircdir $+ Monsters\to_make\ $+ %mon.name Battle Status
    var %desc $readini $mircdir $+ Monsters\to_make\ $+ %mon.name Descriptions Char
    var %drops $readini $mircdir $+ Monsters\to_make\ $+ %mon.name Stuff Drops
    var %monster.type $readini $mircdir $+ Monsters\to_make\ $+ %mon.name Monster Type
    var %tech.lern $readini $mircdir $+ Monsters\to_make\ $+ %mon.name Monster TechLearn
    var %Size $readini $mircdir $+ Monsters\to_make\ $+ %mon.name Monster Size
    var %Elite $readini $mircdir $+ Monsters\to_make\ $+ %mon.name Monster Elite
    var %SuperEl $readini $mircdir $+ Monsters\to_make\ $+ %mon.name Monster SuperElite
    var %Ghost $readini $mircdir $+ Monsters\to_make\ $+ %mon.name Monster Ghost

    var %weapon $readini $mircdir $+ Monsters\to_make\ $+ %mon.name Weapons Equipped
    var %weaponlevel $readini $mircdir $+ Monsters\to_make\ $+ %mon.name Weapons %weapon

    ;var %eq,head $readini $mircdir $+ Monsters\to_make\ $+ %mon.name Equipment Head
    ;var %eq,Body $readini $mircdir $+ Monsters\to_make\ $+ %mon.name Equipment Body
    ;var %eq,Hand $readini $mircdir $+ Monsters\to_make\ $+ %mon.name Equipment Hand
    :var %eq,Legs $readini $mircdir $+ Monsters\to_make\ $+ %mon.name Equipment Legs
    ;var %eq,Feets $readini $mircdir $+ Monsters\to_make\ $+ %mon.name Equipment Feets
    ;var %eq,ac $readini $mircdir $+ Monsters\to_make\ $+ %mon.name Equipment Accessory
    ;var %eq,ac2 $readini $mircdir $+ Monsters\to_make\ $+ %mon.name Equipment Accessory2

    var %nat.arm $readini $mircdir $+ Monsters\to_make\ $+ %mon.name NaturalArmor Name
    var %nat.arm.cur $readini $mircdir $+ Monsters\to_make\ $+ %mon.name NaturalArmor Current
    var %nat.arm.max $readini $mircdir $+ Monsters\to_make\ $+ %mon.name NaturalArmor Max

    var %montech $read($mircdir $+ dbs\techniques.db, w, * $+ %weapon $+ *)
    var %montech2 $remove(%montech,=,%weapon)

    var %canstagger $readini $mircdir $+ Monsters\to_make\ $+ %mon.name Info CanStagger
    var %rageignore $readini $mircdir $+ Monsters\to_make\ $+ %mon.name Info Rage
    var %ai_type $readini $mircdir $+ Monsters\to_make\ $+ %mon.name Info ai_type
    var %canflee $readini $mircdir $+ Monsters\to_make\ $+ %mon.name Info CanFlee
    var %spawnafter $readini $mircdir $+ Monsters\to_make\ $+ %mon.name Info SpawnAfterDeath
    var %igdrain $readini $mircdir $+ Monsters\to_make\ $+ %mon.name Info IgnoreDrain
    var %biome $readini $mircdir $+ Monsters\to_make\ $+ %mon.name Info Biome
    var %moon $readini $mircdir $+ Monsters\to_make\ $+ %mon.name Info MoonPhase
    var %daytime $readini $mircdir $+ Monsters\to_make\ $+ %mon.name Info TimeOfDay
    var %cantaunt $readini $mircdir $+ Monsters\to_make\ $+ %mon.name Info CanTaunt
    var %Guardians $readini $mircdir $+ Monsters\to_make\ $+ %mon.name Info Guardian
    var %jr $readini $mircdir $+ Monsters\to_make\ $+ %mon.name Info JustReleaseDefence
    var %hurtbtaunt $readini $mircdir $+ Monsters\to_make\ $+ %mon.name Info HurtByTaunt
    var %healbtaunt $readini $mircdir $+ Monsters\to_make\ $+ %mon.name Info HealByTaunt
    var %igpres $readini $mircdir $+ Monsters\to_make\ $+ %mon.name Info IgnorePresident
    var %igout $readini $mircdir $+ Monsters\to_make\ $+ %mon.name Info IgnoreOutpost
    var %ima $readini $mircdir $+ Monsters\to_make\ $+ %mon.name Info ImmuneToMagic
    set %DeathC $readini $mircdir $+ Monsters\to_make\ $+ %mon.name Info DeathConditions
    var %CanUseItems $readini $mircdir $+ Monsters\to_make\ $+ %mon.name Info CanUseItems

    var %Style $readini $mircdir $+ Monsters\to_make\ $+ %mon.name Styles Equipped
    var %slevel $readini $mircdir $+ Monsters\to_make\ $+ %mon.name Styles %Style


    msg $nick here is $3
    msg $nick 3BaseStats [[ Name: 7 %basestats.name 3 HP: 7 %basestats.hp 3 TP: 7 %basestats.tp 3 DEF: 7 %basestats.def 3 INT: 7 %basestats.int 3 SPD: 7 %basestats.spd 3 IG: 7 %basestats.ig 3 Status:7 %battle.status 3 ]]
    msg $nick 3Monsterdescription: 7 %desc
    msg $nick 3Drops: 7 %drops
    msg $nick 3Monster Infos:  Type: $iif(%monster.type != $null, 7 %monster.type 3 , 7none3) Size: $iif(%Size != $null, 7 %Size3 , 7none3) TechLearn: $iif(%Tech.learn != $null, 7 %tech.learn3 , 7none3) Elite: $iif(%Elite != $null, 7 %monster.type3 , 7none3) SuperElite: $iif(%monster.type != $null, 7 %SuperEl3 , 7none3) Ghost: $iif(%monster.type != $null, 7 %Ghost3 , 7none3) 
    msg $nick 3Monsterweapon and Level: 7 %weapon 3 Level: 7 %weaponlevel
    msg $nick 3Monstertechniques: 7 %montech2
    msg $nick 3NaturalArmor: Name: $iif(%nat.arm != $null, 7 %nat.arm 3 , 7none3) 3 Current: $iif(%nat.arm.cur != $null, 7 %nat.arm.cur 3, 7 none3) 3Max: $iif(%nat.arm.max != $null, 7 %nat.arm.max 3 , 7none3)
    msg $nick  ------------------------------------- 7Properties of $3 -------------------------------------
    msg $nick 3 $+ $3 Can be staggered: 7 $iif(%canstagger == yes, yes, no)
    msg $nick 3 $+ $3 Will be Boosted by Darkness?: 7 $iif(%rageignore == ignore, no, yes)
    msg $nick 3 $+ $3 Will be generatet as: 7 $iif(%ai_type == none, normal, %ai_type) 3 Monster
    msg $nick 3 $+ $3 Will be generatet at MinStreak: 7 $iif($readini($mircdir $+ Monsters\to_make\ $+ %mon.name, Info, Streak) == $null, 0, $readini($mircdir $+ Monsters\to_make\ $+ %mon.name, Info, Streak)) 3 - StreakMax: 7 $iif($readini($mircdir $+ Monsters\to_make\ $+ %mon.name, Info, StreakMax) == $null, unlimited, $readini($mircdir $+ Monsters\to_make\ $+ %mon.name, Info, StreakMax))
    msg $nick 3 $+ $3 Can flee out of the battle?: 7 $iif(%canflee == true, yes, no)
    msg $nick 3 Which monster spawns after $3 dies?: 7 $iif(%spawnafter == $null, none) $iif(%spawnafter == none, none) $iif(%spawnafter != $null, %spawnafter) 
    msg $nick 3 $+ $3 Will ignore the effect of !drainsamba?: 7 $iif(%IgnoreDrain == true, yes, no)
    msg $nick 3 $+ $3 Will be generatet in Biome: 7 $iif(%Biome == $null, All, %biome)
    msg $nick 3 $+ $3 Will be generatet by MoonPhase: 7 $iif(%moon == $null, All, %moon)
    msg $nick 3 $+ $3 Will be generatet at Daytime: 7 $iif(%daytime == $null, Everytime, %daytime)
    msg $nick 3Can $3 Taunting Others ?: 7 $iif(%cantaunt == true, yes, no)
    msg $nick  $iif(%Guardians == $null || %guardians == none, 3 $+ $3 Will take fully damage, 3 $+ $3 Will take 0 damage when $replace(%guardians,., $chr(32) & $chr(32))))
    msg $nick 3How much percent of damage will be blocked when JustRelease is started?: 7 $iif(%jr == $null || %jr == none, 0 $+ %, %jr $+ %)
    msg $nick 3 $+ $3 Will be hurt when taunting them?: 7 $iif(%hurtbtaunt == true, yes, no)
    msg $nick 3 $+ $3 Will be heal when taunting them?: 7 $iif(%healbtaunt == true, yes, no)
    msg $nick 3 $+ $3 Will be generated by the President event? 7 $iif(%igpre == true, no, yes)
    msg $nick 3 $+ $3 Will be generated by the Outpost event? 7 $iif(%igout == true, no, yes)
    msg $nick 3 $+ $3 Will be immune to magic $iif(%ima == true, yes, no)
    msg $nick 3 $+ $3 Will be dead when you killed with: 7 $iif(%DeathC == $null || %DeathC == none, all, %DeathC)
    msg $nick 3 $+ $3 Can Use Items?: 7 $iif(%CanUseItems == true, yes, no)
    msg $nick 3 $+ $3 Know the following Style: 7 %style 3 - Level:7 %slevel
    msg $nick ------------------------------------- 7 $3 $+ 's Reactions --------------------------------------
    $rotations($3)
    msg $nick end of stats for $3
  }
}

alias rotations {
  var %mon.name2 $1 $+ .char
  var %entry.line 1
  var %currentrot2 $readini($mircdir $+ monsters\to_make\ $+ %mon.name2, Rotations, Current)
  msg $nick 3 Actions for the Monster $remove(%mon.name,.char) 
  while (%entry.line <= %currentrot2) {
    msg $nick 3Round: 7 %entry.line 3 action: 7 $readini($mircdir $+ monsters\to_make\ $+ %mon.name2, Rotations, %entry.line) 3
    inc %entry.line 1
  }
}

;@setup technique monname weaponname techname var1 var2 var3 var4 var5 var6 var7 var8 var9 var10 var11 var12 var13 var14 var15 var16 var17 var18 var19







off 3:text:!write:*: {
  set %lines $lines(test.txt)
  set %newline $calc(%lines + 3)
  var %space $chr(32)
  write test.txt $crlf $crlf hallo welt
  ;write test.txt $crlf
  ;write test.txt 
}
