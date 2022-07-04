on 3:TEXT:@create mon *:*: {
  var %mon.name $3 $+ .char
  if ($exists(C:\BattleArena\Monsters\ $+ %mon.name) == $true) { msg $nick Sorry $nick the Monster $remove(%mon.name,.char) already exists. | msg $nick please choose a another name  }
  set %create.mon. $+ $nick on
  msg $nick The Monster creation phase has begun. Now i has created a temp monfile with default values. You can edit this file by following my instruction.
  msg $nick You can finish the creation process by typing @upload mon name
  .copy C:\BattleArena\Monsters\to_make\new_mon.char C:\BattleArena\Monsters\to_make\ $+ %mon.name
  writeini C:\BattleArena\Monsters\to_make\ $+ %mon.name BaseStats Name $3

  var %basestats.hp $readini C:\BattleArena\Monsters\to_make\ $+ %mon.name BaseStats HP
  var %basestats.tp $readini C:\BattleArena\Monsters\to_make\ $+ %mon.name BaseStats TP
  var %basestats.str $readini C:\BattleArena\Monsters\to_make\ $+ %mon.name BaseStats Str
  var %basestats.def $readini C:\BattleArena\Monsters\to_make\ $+ %mon.name BaseStats Def
  var %basestats.int $readini C:\BattleArena\Monsters\to_make\ $+ %mon.name BaseStats Int
  var %basestats.spd $readini C:\BattleArena\Monsters\to_make\ $+ %mon.name BaseStats Spd
  var %basestats.name $readini C:\BattleArena\Monsters\to_make\ $+ %mon.name BaseStats Name
  var %basestats.ig $readini C:\BattleArena\Monsters\to_make\ $+ %mon.name BaseStats IgnitionGauge

  var %battle.status $readini C:\BattleArena\Monsters\to_make\ $+ %mon.name Battle Status
  var %desc $readini C:\BattleArena\Monsters\to_make\ $+ %mon.name Descriptions Char
  var %drops $readini C:\BattleArena\Monsters\to_make\ $+ %mon.name Stuff Drops
  var %monster.type $readini C:\BattleArena\Monsters\to_make\ $+ %mon.name Monster Type
  var %tech.lern $readini C:\BattleArena\Monsters\to_make\ $+ %mon.name Monster TechLearn
  var %Size $readini C:\BattleArena\Monsters\to_make\ $+ %mon.name Monster Size
  var %Elite $readini C:\BattleArena\Monsters\to_make\ $+ %mon.name Monster Elite
  var %SuperEl $readini C:\BattleArena\Monsters\to_make\ $+ %mon.name Monster SuperElite
  var %Ghost $readini C:\BattleArena\Monsters\to_make\ $+ %mon.name Monster Ghost

  var %weapon $readini C:\BattleArena\Monsters\to_make\ $+ %mon.name Weapons Equipped
  var %weaponlevel $readini C:\BattleArena\Monsters\to_make\ $+ %mon.name Weapons %weapon

  var %eq,head $readini C:\BattleArena\Monsters\to_make\ $+ %mon.name Equipment Head
  var %eq,Body $readini C:\BattleArena\Monsters\to_make\ $+ %mon.name Equipment Body
  var %eq,Hand $readini C:\BattleArena\Monsters\to_make\ $+ %mon.name Equipment Hand
  var %eq,Legs $readini C:\BattleArena\Monsters\to_make\ $+ %mon.name Equipment Legs
  var %eq,Feets $readini C:\BattleArena\Monsters\to_make\ $+ %mon.name Equipment Feets
  var %eq,ac $readini C:\BattleArena\Monsters\to_make\ $+ %mon.name Equipment Accessory
  var %eq,ac2 $readini C:\BattleArena\Monsters\to_make\ $+ %mon.name Equipment Accessory2

  var %nat.arm $readini C:\BattleArena\Monsters\to_make\ $+ %mon.name NaturalArmor Name
  var %nat,arm.cur $readini C:\BattleArena\Monsters\to_make\ $+ %mon.name NaturalArmor Current
  var %nat.arm.max $readini C:\BattleArena\Monsters\to_make\ $+ %mon.name NaturalArmor Max

  msg $nick here is the default $3
  msg $nick 3BaseStats [[ Name: 7 %basestats.name 3 HP: 7 %basestats.hp 3 TP: 7 %basestats.tp 3 DEF: 7 %basestats.def 3 INT: 7 %basestats.int 3 SPD: 7 %basestats.spd 3 IG: 7 %basestats.ig 3 Status:7 %battle.status 3 ]]
  msg $nick 3Monsterdescription: 7 %desc
  msg $nick 3Drops: 7 %drops
  msg $nick 3Monster Infos:  Type: $iif(%monster.type != $null, 7 %monster.type3 , 7none3) Size: $iif(%Size != $null, 7 %Size3 , 7none3) TechLearn: $iif(%Tech.learn != $null, 7 %tech.learn3 , 7none3) Elite: $iif(%Elite != $null, 7 %monster.type3 , 7none3) SuperElite: $iif(%monster.type != $null, 7 %SuperEl3 , 7none3) Ghost: $iif(%monster.type != $null, 7 %Ghost3 , 7none3) 
  msg $nick 3Monsterweapon and Level: 7 %weapon 3 Level: 7 %weaponlevel
  msg $nick 3Armor: HEAD: $iif(%eq.head != $null, 7 %eq.head3 , 7none3) BODY: $iif(%eq.body != $null, 7 %eq.body3 , 7none3) HAND: $iif(%eq.hand != $null, 7 %eq.hand3 , 7none3) LEGS: $iif(%eq.legs != $null, 7 %eq.legs3 , 7none3) FEETS: $iif(%eq.feets != $null, 7 %eq.feets3 , 7none3) ACCESSORY: $iif(%eq.ac != $null, 7 %eq.ac3 , 7none3) ACCESSORY2: $iif(%eq.ac2 != $null, 7 %eq.ac23 , 7none3)
  timer1 1 1 msg $nick 3NaturalArmor: Name: $iif(%nat.arm != $null, 7 %nat.arm3 , 7none3) 3 Current: $iif(%nat.cur != $null, 7 %nat.cur3 , 7none3) 3Max: $iif(%nat.max != $null, 7 %nat.max3 , 7none3)
  timer2 1 3 msg $nick if this value is not okay you can edit this please following the step by step setup now.  Step 1 is setting up the own Basestats so write now the following command:
  timer3 1 7 msg $nick @setup monname basestats num1 num2 num3 num4 num5 num6 num7
  timer4 1 9 msg $nick Example: 7@setup Tokka1 BaseStats 400 10 5 8 5 12 103 - So the Monster has the following Stats: 7 400 HP 10 TP 5 STR 8 DEF 5 INT 12 SPD Name: Tokka2 Status: Active
}

on 3:text:@setup * basestats *: *: {
  if ($nick isin %create.mon. $+ $nick) {
    if ($4 !isnum) { msg $nick Error: You can only use numbers for the basestats  }
    var %mon.name $2 $+ .char

    writeini C:\BattleArena\Monsters\to_make\ $+ %mon.name BaseStats HP $4
    writeini C:\BattleArena\Monsters\to_make\ $+ %mon.name BaseStats TP $5
    writeini C:\BattleArena\Monsters\to_make\ $+ %mon.name BaseStats STR $6
    writeini C:\BattleArena\Monsters\to_make\ $+ %mon.name BaseStats DEF $7
    writeini C:\BattleArena\Monsters\to_make\ $+ %mon.name BaseStats INT $8
    writeini C:\BattleArena\Monsters\to_make\ $+ %mon.name BaseStats SPD $9
    writeini C:\BattleArena\Monsters\to_make\ $+ %mon.name BaseStats IgnitionGauge $10
    writeini C:\BattleArena\Monsters\to_make\ $+ %mon.name BaseStats Name $2

    writeini C:\BattleArena\Monsters\to_make\ $+ %mon.name Batte HP $4
    writeini C:\BattleArena\Monsters\to_make\ $+ %mon.name Batte TP $5
    writeini C:\BattleArena\Monsters\to_make\ $+ %mon.name Batte STR $6
    writeini C:\BattleArena\Monsters\to_make\ $+ %mon.name Batte DEF $7
    writeini C:\BattleArena\Monsters\to_make\ $+ %mon.name Batte INT $8
    writeini C:\BattleArena\Monsters\to_make\ $+ %mon.name Batte SPD $9
    writeini C:\BattleArena\Monsters\to_make\ $+ %mon.name Batte IgnitionGauge $10
    writeini C:\BattleArena\Monsters\to_make\ $+ %mon.name Batte Name $2

    msg $nick Custom Basestats for $2 are written. Lets go to the next step is setting up a monsterdescription.
    msg $nick The Description is the Info about the Monster before a battle begins. To setup write:
    msg $nick 7@setup monname desc text 3- Example: 7@setup tokka2 desc Is A small turtle
  }
}

on 3:text:@setup * desc *: *: {
  if ($nick isin %create.mon. $+ $nick) {
    var %mon.name $2 $+ .char
    writeini C:\BattleArena\Monsters\to_make\ $+ %mon.name Descriptions Char $4-
    msg $nick Monsterdescription: 11" $4- " was successfully setting up. 
    msg $nick the next step is to setup a 4DeathMessage when the monster dies.
    msg $nick to do this write 7 @setup monname deathmessage text
  }
}

on 3:text:@setup * deathmessage *: *: {
  if ($nick isin %create.mon. $+ $nick) {
    var %mon.name $2 $+ .char
    writeini C:\BattleArena\Monsters\to_make\ $+ %mon.name Descriptions DeathMessage $4-
    msg $nick The Deathmessage: 11" $4- " was successfully setting up. 
    msg $nick the next step is to setup 4Some Drops when the monster dies.
    msg $nick to do this write 7 @setup monname drops item
    msg $nick be sure that the item exists check it via !info item itemname
  }
}

on 3:text:@setup * drops *: *: {
  if ($nick isin %create.mon. $+ $nick) {
    var %mon.name $2 $+ .char
    var %item $4-
    writeini C:\BattleArena\Monsters\to_make\ $+ %mon.name Stuff Drops %item
    msg $nick The drops for $2 are the following: 11" $replace(%item,., $chr(32)) "
    msg $nick the next step is to setup a stagger value. First you can enable or disable this feature by typing: 7@setup monname CanStagger yes/no
    msg $nick If you set to yes you must define an stagger amount by typing 7@Setup monname StaggerAmount 7num1 num2
    msg $nick a Staggered Monster can not do anything for 1 turn.
  }
}

on 3:text:@setup * CanStagger *: *: {
  if ($nick isin %create.mon. $+ $nick) {
    var %mon.name $2 $+ .char
    writeini C:\BattleArena\Monsters\to_make\ $+ %mon.name Info CanStagger $4
    if ($4 == yes)  { msg $nick You enable the 4Stagger Feature for $2. Now you must define an amount by typing 7@Setup monname StaggerAmount 7num1 num2  }
    if ($4 == no)   { msg $nick You disabled the 4Stagger Feature for $2. You don't need to setup an stagger amount. Now the next step is you must setup the Rage value by typing 7@setup monname Rage Ignore | msg $nick If The Rage Mode is set to Ignore the monster get no boosts if darkness occurs. }
  }
}

on 3:text:@setup * StaggerAmount *: *: {
  if ($nick isin %create.mon. $+ $nick) {
    var %mon.name $2 $+ .char
    var %num1 $4
    var %num2 $5
    writeini C:\BattleArena\Monsters\to_make\ $+ %mon.name Info StaggerAmount $rand(%num1,%num2)
    msg $nick Now the next step is you must setup the Rage value by typing 7@setup monname Rage Ignore | msg $nick If The Rage Mode is set to Ignore the monster get no boosts if darkness occurs. By Default Rage Value is commented.
  }
}
on 3:text:@setup * Rage *: *: {
  if ($nick isin %create.mon. $+ $nick) {
    var %mon.name $2 $+ .char
    writeini C:\BattleArena\Monsters\to_make\ $+ %mon.name Info Rage $4
    msg $nick When darkness occurs and Rage is set to ignore the monster $2 will not be boosted.
    msg $nick next and the first important setup is to define which ki the monster should be have called 11"ai_type"
    msg $nick Valid types are:
    msg $nick -> 4defender - This AI type will do nothing but defend each round (think Orb Fountain or Lost Soul)
    msg $nick -> 4berserker - This AI type will attack anybody also his own allies.
    msg $nick -> 4paytoattack - This AI type will not take action in battle unless it has been paid (given red orbs). This AI type only works on NPCs as monsters cannot give items to another monster.
    msg $nick -> 4Portal - This AI type can summon every turn another monster to the battlefield
    msg $nick -> 4Healer - This AI type will only use healtechs on his allies every turn.
    msg $nick leave this value black to define a normal monster
    msg $nick to set a type now write: 7@setup monname ai_type type (See list)
  }
}

on 3:text:@setup * ai_type *: *: {
  if ($nick isin %create.mon. $+ $nick) {
    var %mon.name $2 $+ .char
    var %type $4
    writeini C:\BattleArena\Monsters\to_make\ $+ %mon.name Info ai_type $4
    if (%type == defender) { msg $nick Now you set the ai to 4 %type - The Monster $2 does nothing he also stands still }
    if (%type == berserker) { msg $nick Now you set the ai to 4 %type - The Monster $2 will also can attack allies and other things }
    if (%type == paytoattack) && ($readini(C:\BattleArena\Monsters\to_make\ $+ %mon.name Info Flag == npc) { msg $nick Now you set the ai to 4 %type - for NPC $2 to do anything when you give $2 some orbs }
    if (%type == Portal) { msg $nick Now you set the ai to 4 %type - The Monster $2 can now summon other monsters to the battlefield }
    if (%type == Healer) { msg $nick Now you set the ai to 4 %type - The Monster $2 will only use healtechs for its allies  }
    timer1 1 2 msg $nick the next thing to setup is the Level when the Monster should be generated called 11"streak and streakmax"
    msg $nick to setup this you can define one value by typing 7@setup monname streak num1 or 7@setup monname streakmax num1
  }
}

on 3:text:@setup * streak *: *: {
  if ($nick isin %create.mon. $+ $nick) {
    var %mon.name $2 $+ .char
    writeini C:\BattleArena\Monsters\to_make\ $+ %mon.name Info Streak $4
    msg $nick Now the Monster $2 will be generated at minimum streak $4
    msg $nick the next setup is to define if the monster canflee out of battles
    msg $nick you can setup this by typing 7@setup monname canflee true/false
  }
}

on 3:text:@setup * canflee *: *: {
  if ($nick isin %create.mon. $+ $nick) {
    var %mon.name $2 $+ .char
    writeini C:\BattleArena\Monsters\to_make\ $+ %mon.name Info canflee $4
    msg $nick Now the Monster $2 can flee out of the battles.
    msg $nick the next setup is to define if the monster can use items inside a battle
    msg $nick you can setup this by typing 7@setup monname CanUseItems true/false
  }
}

on 3:text:@setup * streakmax *: *: {
  if ($nick isin %create.mon. $+ $nick) {
    var %mon.name $2 $+ .char
    writeini C:\BattleArena\Monsters\to_make\ $+ %mon.name Info StreakMax $4
    msg $nick Now the Monster $2 will be generated to the max streak at $4
    msg $nick the next setup is to define if the monster can use items inside a battle
    msg $nick you can setup this by typing 7@setup monname CanUseItems true/false
  }
}

on 3:text:@setup * CanUseItems *: *: {
  if ($nick isin %create.mon. $+ $nick) {
    var %mon.name $2 $+ .char
    writeini C:\BattleArena\Monsters\to_make\ $+ %mon.name Info CanUseItems $4
    msg $nick now the Monster $2 canflee out of battles or not.
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
  if ($nick isin %create.mon. $+ $nick) {
    var %mon.name $2 $+ .char
    writeini C:\BattleArena\Monsters\to_make\ $+ %mon.name Info spawnafterdeath $4
    msg $nick now the monster $4 should be generated after 11" $2 " is died.
    msg $nick Another Optional feature to setup is the biom who generated the monster
    msg $nick to do this write the following command: 7@setup monname biom battlefieldname
  }
}

on 3:text:@setup * biom *: *: {
  if ($nick isin %create.mon. $+ $nick) {
    var %mon.name $2 $+ .char
    writeini C:\BattleArena\Monsters\to_make\ $+ %mon.name Info biom $4
    msg $nick now the monster $2 will only generated at Biom: 11 $4
    msg $nick the next important thing you must setup is to ignore a skill called drainsamba if you want
    msg $nick you can setup this by typing 7@setup monname IgnoreDrain true/false
  }
}

on 3:text:@setup * IgnoreDrain *: *: {
  if ($nick isin %create.mon. $+ $nick) {
    var %mon.name $2 $+ .char
    writeini C:\BattleArena\Monsters\to_make\ $+ %mon.name Info IgnoreDrain $4
    msg $nick Now the Skill !drainsamba takes no effekt by attacking $2
    msg $nick the next setting is optional you can setup a specific moonphase to generate the monster
    msg $nick so type 7@setup monname moonphase phase
    msg $nick Valid Phases are: Full Moon or Crescent Moon or Gibbous Moon or New Moon or Quarter Moon or Blood Moon (with the spaces)
  }
}

on 3:text:@setup * moonphase *: *: {
  if ($nick isin %create.mon. $+ $nick) {
    var %mon.name $2 $+ .char
    writeini C:\BattleArena\Monsters\to_make\ $+ %mon.name Info moonphase $4
    msg $nick the monster $2 will only appear at 11 $4
    msg $nick the next setting is optional you can setup a specific daytime to generate the monster
    msg $nick so type 7@setup monname daytime timeofday
    msg $nick Valid Times are: Morning, Noon, Evening and Night.
    msg $nick next setup is to define can the monster taunt others or not
    msg $nick to do this write: 7@setup monname CanTaunt true/false
  }
}

on 3:text:@setup * CanTaunt *: *: {
  if ($nick isin %create.mon. $+ $nick) {
    var %mon.name $2 $+ .char
    writeini C:\BattleArena\Monsters\to_make\ $+ %mon.name Info CanTaunt $4
    msg $nick now the monster $2 can now taunting others if it set to true
    msg $nick now setup a guardian to protect the monster if the guardian is in the battle $2 will take 0 damage.
    msg $nick to set a guardian write 7@setup monnname guardian monname2
  }
}

on 3:text:@setup * guardian *: *: {
  if ($nick isin %create.mon. $+ $nick) {
    var %mon.name $2 $+ .char
    writeini C:\BattleArena\Monsters\to_make\ $+ %mon.name Info guardian $4-
    msg $nick now the monster $2 has the guardians $4-
    msg $nick next setup can be the JustReleaseDefense - its an Optional Setting to block a percentage amount of damage from the skill !justrelease
    msg $nick to setup write: 7@setup monname JustReleaseDefense num%
  }
}

on 3:text:@setup * JustReleaseDefense *: *: {
  if ($nick isin %create.mon. $+ $nick) {
    var %mon.name $2 $+ .char
    writeini C:\BattleArena\Monsters\to_make\ $+ %mon.name Info JustReleaseDefense $4-
    msg $nick the monster $2 will now block $4 $+ % of damage from !justrelease
    msg $nick the next setting is to define 4HurtByTaunt - This is a Special Value when taunting this monster it will take damage
    msg $nick to setup this write 7@setup monname HurtByTaunt true/false
  }
}

on 3:text:@setup * HurtByTaunt *: *: {
  if ($nick isin %create.mon. $+ $nick) {
    var %mon.name $2 $+ .char
    writeini C:\BattleArena\Monsters\to_make\ $+ %mon.name Info HurtByTaunt $4- 
    msg $nick now the monster $2 will now hurt by taunting 
    msg $nick the next setting is to define 4HealByTaut - This is a Special Value when taunting this monster it will be healed.
    msg $nick to do this write 7@setup monname HealByTaunt true/false
  }
}

on 3:text:@setup * HealByTaunt *: *: {
  if ($nick isin %create.mon. $+ $nick) {
    var %mon.name $2 $+ .char
    writeini C:\BattleArena\Monsters\to_make\ $+ %mon.name Info HealByTaunt $4- 
    msg $nick now the monster $2 will now heal by taunting 
    msg $nick the next setting is to define 4IgnorePresident - This is a Special Value if you dont want that the monster spawn at rescue the president event.
    msg $nick to do this write 7@setup monname IgnorePresident true/false
  }
}

on 3:text:@setup * IgnorePresident *: *: {
  if ($nick isin %create.mon. $+ $nick) {
    var %mon.name $2 $+ .char
    writeini C:\BattleArena\Monsters\to_make\ $+ %mon.name Info IgnorePresident $4-
    msg $nick now the monster $2 will now ignore the president event if it set to true
    msg $nick the next setting is to define 4IgnoreOutpost - This is a Special Value if you dont want that the monster spawn at rescue the Outpost event.
    msg $nick to do this write 7@setup monname IgnoreOutpost true/false
  }
} 

on 3:text:@setup * IgnoreOutpost *: *: {
  if ($nick isin %create.mon. $+ $nick) {
    var %mon.name $2 $+ .char
    writeini C:\BattleArena\Monsters\to_make\ $+ %mon.name Info IgnoreOutpost $4-
    msg $nick now the monster $2 will now ignore the outpost event if it set to true
    msg $nick next setup is the option 4ImmunToMagic - its only for boss monsters
    msg $nick to set this write @setup monname ImmunToMagic true
  }
} 

on 3:text:@setup * ImmunToMagic *: *: {
  if ($nick isin %create.mon. $+ $nick) {
    var %mon.name $2 $+ .char
    writeini C:\BattleArena\Monsters\to_make\ $+ %mon.name Info ImmunToMagic $4-
    msg $nick now the monster $2 will now be immune to magic when its true
    msg $nick next setup is the option 4DeathConditions - Its a Specialflage you can define by which action a monster can die.
    msg $nick if the monster is not killed by the called actions it will be auto revieve.
    msg $nick valid actions are: melee, magic, tech, item, renkei, status, magiceffect.
    msg $nick you can define multiple actions by putting a . between it. Example: melee.magic
    msg $nick so you should write 7@setup monname DeathConditions actions
  }
} 

on 3:text:@setup * IgnoreOutpost *: *: {
  if ($nick isin %create.mon. $+ $nick) {
    var %mon.name $2 $+ .char
    writeini C:\BattleArena\Monsters\to_make\ $+ %mon.name Info ImmunToMagic $4-
    msg $nick now the monster $2 will now immune to magic if it set to true
    msg $nick next setup is the option 4DeathConditions - Its a Specialflage you can define by which action a monster can die.
    msg $nick if the monster is not killed by the called actions it will be auto revieve.
    msg $nick valid actions are: melee, magic, tech, item, renkei, status, magiceffect.
    msg $nick you can define multiple actions by putting a . between it. Example: melee.magic
    msg $nick so you should write 7@setup monname DeathConditions actions
  }
} 
on 3:text:@setup * DeathConditions *: *: {
  if ($nick isin %create.mon. $+ $nick) {
    var %mon.name $2 $+ .char
    writeini C:\BattleArena\Monsters\to_make\ $+ %mon.name Info DeathConditions $4-
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
  if ($nick isin %create.mon. $+ $nick) {
    var %mon.name $2 $+ .char
    if ($4 == Type)  { writeini C:\BattleArena\Monsters\to_make\ $+ %mon.name Monster Type $5- | msg $nick You Set the Monstertype for $2 to 4 $5- }
    if ($4 == Size) && ($5 isin small/medium/large) { writeini C:\BattleArena\Monsters\to_make\ $+ %mon.name Monster Size $5- | msg $nick You Set the Monstersize for $2 to 4 $5- }
    if ($4 == Elite) && ($5 == true) { writeini C:\BattleArena\Monsters\to_make\ $+ %mon.name Monster Elite $5- | msg $nick You Set the Monster $2 to 4 $5- }
    if ($4 == SuperElite) && ($5 == true) { writeini C:\BattleArena\Monsters\to_make\ $+ %mon.name Monster SuperElite $5- | msg $nick You Set the Monster $2 to 4 $5- }
    if ($4 == TechLearn) && ($5 == true) { writeini C:\BattleArena\Monsters\to_make\ $+ %mon.name Monster TechLearn $5- | msg $nick You Set the TechLearn for $2 to 4 $5- }
    if ($4 == Ghost) && ($5 == true) { writeini C:\BattleArena\Monsters\to_make\ $+ %mon.name Monster Ghost $5- | msg $nick You Set the Monster $2 to 4 $5- }
    msg $nick now you can setup a monsterweapon quickly by following the command Syntax:
    msg $nick 7@setup monname monweapon nameoftheweapon level var1 var2 var3 var4 var5 var6 var7 var8 var9 var10 var11 var12 var13 var14 var15 var16 var17 var18 var19 var20
    msg $nick each placeholder replaced an value see below
    /play $nick valuedec.txt  
  }
}

on 3:text:@setup * monweapon *: *: {
  if ($nick isin %create.mon. $+ $nick) {
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
      writeini C:\BattleArena\Monsters\to_make\ $+ %mon.name Weapons Equipped %monweapon2
      writeini C:\BattleArena\Monsters\to_make\ $+ %mon.name Weapons %monweapon2 %weaponlevel
      remini C:\BattleArena\Monsters\to_make\ $+ %mon.name Weapons monsterweaponname

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
      writeini $dbfile(weapons.db) %monweapon2 LinkedWeapon %lw
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
  if ($nick isin %create.mon. $+ $nick) {
    var %mon.name $2 $+ .char
    var %skillname $4
    var %skilllevel $5
    if (%skilllevel > $readini($dbfile(skills.db), %skillname, Max))   { msg $nick Sorry you cant setup this skill with this level please chose a lower value of the level }
    writeini C:\BattleArena\Monsters\to_make\ $+ %mon.name Skills %skillname %skilllevel
    msg $nick You have successfully set up skill 11" %skillname "  and can now continue with the next step that would be the definition of 11"a technique" for the monster weapon
  }
}

on 3:text:@create techniques for *:*: {
  if ($nick isin %create.mon. $+ $nick) {
    var %monweapon $read($dbfile(weapons.db), l, 68)
    var %technames $5-
    var %weaponname $4
    ;set %lines $lines($dbfile(techniques.db))
    :set %newline $calc(%lines + 2)
    if (%weaponname !isin %monweapon) { msg $nick weapon 4 %weaponname  does not  exists, í cant setup the techniques 4 %technames   }
    if (%weaponname isin %monweapon) {
      write $dbfile(techniques.db) $crlf 
      write $dbfile(techniques.db) %weaponname $+ = $+ %technames 
      msg %battlechan techniques for %weaponname are written now you must setup this
    }
  }
}
on 3:text:@setup Technique *: *: {
  if ($nick isin %create.mon. $+ $nick) {
    var %monweapon $read($dbfile(weapons.db), l, 68)
    set %moweap $3
    set %techname $5
    set %montech $read($dbfile(techniques.db), s, %moweap))
  }
}








off 3:text:!write:*: {
  set %lines $lines(test.txt)
  set %newline $calc(%lines + 3)
  var %space $chr(32)
  write test.txt $crlf $crlf hallo welt
  ;write test.txt $crlf
  ;write test.txt 
}
