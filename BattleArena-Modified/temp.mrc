on 3:Text:!taming*:#: { $partial.name.match($nick, $2)  | $skill.taming($nick, %attack.target) }
alias skill.taming {
  if ($person_in_mech($1) = true) { $display.message($readini(translation.dat, errors, Can'tDoThatInMech), private) | halt }
  if (%battle.type = dungeon) { $display.message($readini(translation.dat, errors, Can'tUseThisSkillInDungeon), private) | halt }
  if (%battle.type = dragonhunt) { $display.message($readini(translation.dat, errors, Can'tUseThisSkillInDragonHunt), private) | halt }
  $no.turn.check($1)
  if (no-skill isin %battleconditions) { $display.message($readini(translation.dat, battle, NotAllowedBattleCondition),private) | halt }
  ;if ((no-playerclones isin %battleconditions) && ($readini($char($1), info, flag) = $null)) {  $display.message($readini(translation.dat, battle, NotAllowedBattleCondition),private) | halt }

  $amnesia.check($1, skill) 

  var %skill.name Taming
  if (($skill.needtoequip(%skill.name) = true) && ($skill.equipped.check($1, %skill.name) = false)) { $display.message($readini(translation.dat, errors, SkillNeedsToBeEquippedToUse), private) | halt } 

  if (%mode.pvp = on) { $display.message($readini(translation.dat, errors, ActionDisabledForPVP), private) | halt }

  $checkchar($1)
  if ($skillhave.check($1, Taming) = false) { $set_chr_name($1) | $display.message($readini(translation.dat, errors, DoNotHaveSkill), private)  | halt }
  if (%battleis = off) { $display.message($readini(translation.dat, errors, NoBattleCurrently),private) | halt }
  $check_for_battle($1)
  $person_in_battle($2)

  if ($readini($char($1), Taming_Monster, Taming_used) == yes) { $set_chr_name($1) | $display.message(04Error: %real.name you has already captured a monster in a powered pokeball. If you want a another you must erase this data, private) | halt }
  if ($readini($char($1), Item_Amount, PoweredPokeball) == 1) { $set_chr_name($1) | $display.message(04Error: %real.name you has already captured a monster in a powered pokeball, private) | halt }
  if ($exists($mon($2)) == $false) { $set_chr_name($1) | $display.message(4Error: %real.name 3 Sorry but you can only tame monsters not Bosses, private) | halt }
  ; Decrease the action points
  $action.points($1, remove, $skill.actionpointcheck(taming))

  ; Check for command access
  var %player.access.list $readini($char($1), access, list)
  if (%player.access.list = $null) { writeini $char($1) access list $1 }
  var %maxhp $readini $char($2) BaseStats HP
  var %30percent $round($calc(%maxhp * 30 / 100), 0)
  var %tamingchance 10
  set %random.tam $rand(1,100)
  if (%random.tam <= %tamingchance) && ($readini($char(%attack.target), Battle, HP) <= %30percent) {

    Check for the item "EmptyPokeBall" and consume it, or display an error if they don't have any.
    set %check.item $readini($char($1), item_amount, EmptyPokeball)
    if ((%check.item = $null) || (%check.item <= 0)) { $set_chr_name($1) | $display.message(04Error: %real.name does not have enough Empty Pokeballs to perform this skill, private) | halt }
    $decrease_item($1, EmptyPokeball) 

    ; Display the desc. 
    if ($readini($char($1), descriptions, taming) = $null) { set %skill.description throws a Powered Pokeball to catch $2. }
    else { set %skill.description $readini($char($1), descriptions, Taming) }
    $set_chr_name($1) | $display.message(12 $+ %real.name  $+ %skill.description, battle) 
    if ($readini($char($2), NaturalArmor, Name) != $null) {

      var %taming.armor.name $readini $char($2) NaturalArmor Name
      var %taming.armor.Max $readini $char($2) NaturalArmor Max

      writeini $char($nick) Taming_Monster NaturalArmor-Name %taming.armor.name
      writeini $char($nick) Taming_Monster NaturalArmor-Max %taming.armor.Max
      writeini $char($nick) Taming_Monster NaturalArmor-Current %taming.armor.Max

    }
    var %tamingname $replace($readini($char($2), BaseStats, Name), $chr(32), _)
    var %taming.level $get.level($2)
    var %taming.hp $readini $char($2) BaseStats HP
    var %taming.tp $readini $char($2) BaseStats TP
    var %taming.str $readini $char($2) BaseStats Str
    var %taming.def $readini $char($2) BaseStats def
    var %taming.int $readini $char($2) BaseStats int   
    var %taming.spd $readini $char($2) BaseStats spd
    var %taming.ig $readini $char($2) BaseStats IgnitionGauge

    writeini $char($nick) Taming_Monster Name %tamingname
    writeini $char($nick) Taming_Monster HP %taming.hp
    writeini $char($nick) Taming_Monster TP %taming.tp
    writeini $char($nick) Taming_Monster Str %taming.str
    writeini $char($nick) Taming_Monster def %taming.def
    writeini $char($nick) Taming_Monster int %taming.int
    writeini $char($nick) Taming_Monster spd %taming.spd
    writeini $char($nick) Taming_Monster IgnitionGauge %taming.ig
    writeini $char($nick) Taming_Monster Level %taming.level

    writeini $char($nick) Item_Amount PoweredPokeBall 1

    ;Set the other monster as dead
    writeini $char($2) battle status dead
    writeini $char($2) battle hp 0

    writeini $txtfile(battle2.txt) style $nick $+ .lastaction Taming
    writeini $char($nick) Taming_Monster Taming_used yes

    $skill.nextturn.check(Taming, $nick)
  }
  else {
    $display.message(12 $+ %real.name  failed to tame $2. Please Try again next turn, battle) 
    $skill.nextturn.check(Taming, $nick)
  }
}

on 3:text:!ThrowPoke:#: { $skill.ThrowPoke($nick) }
alias skill.throwPoke {
  if (%battleis == on) {
    if ($person_in_mech($1) = true) { $display.message($readini(translation.dat, errors, Can'tDoThatInMech), private) | halt }
    if (%battle.type = dungeon) { $display.message($readini(translation.dat, errors, Can'tUseThisSkillInDungeon), private) | halt }
    if (%battle.type = dragonhunt) { $display.message($readini(translation.dat, errors, Can'tUseThisSkillInDragonHunt), private) | halt }
    $no.turn.check($1)
    if (no-skill isin %battleconditions) { $display.message($readini(translation.dat, battle, NotAllowedBattleCondition),private) | halt }
    var %pball $readini($char($1), Item_Amount, PoweredPokeBall)

    $amnesia.check($1, skill) 

    var %skill.name ThrowPoke
    if (($skill.needtoequip(%skill.name) = true) && ($skill.equipped.check($1, %skill.name) = false)) { $display.message($readini(translation.dat, errors, SkillNeedsToBeEquippedToUse), private) | halt } 

    if (%mode.pvp = on) { $display.message($readini(translation.dat, errors, ActionDisabledForPVP), private) | halt }

    $checkchar($1)
    if ($skillhave.check($1, ThrowPoke) = false) { $set_chr_name($1) | $display.message($readini(translation.dat, errors, DoNotHaveSkill), private)  | halt }
    if (%battleis = off) { $display.message($readini(translation.dat, errors, NoBattleCurrently),private) | halt }
    $check_for_battle($1)

    var %monster $readini($char($1), Taming_Monster, Name)
    if ($isfile($char(%monster $+ _pokemon)) == $true) { $set_chr_name($1) | $display.message(04Error: %real.name has already used this skill for this battle and cannot use it again!, private) | halt }
    if (%pball == $null) { $display.message(4Sorry $nick you has no Powered Pokeball to use that Skill ,battle) | halt }

    ; Decrease the action points
    $action.points($1, remove, $skill.actionpointcheck(ThrowPoke))

    ; Display the desc. 
    if ($readini($char($1), descriptions, ThrowPoke) = $null) { set %skill.description releases $gender($1) Throws the Powered Pokeball and it shows up a %monster to came as assist in the fight for you. }
    else { set %skill.description $readini($char($1), descriptions, shadowcopy) }
    $set_chr_name($1) | $display.message(12 $+ %real.name  $+ %skill.description, battle) 

    ; Check for command access
    var %player.access.list $readini($char($1), access, list)
    if (%player.access.list = $null) { writeini $char($1) access list $1 }

    .copy $mon(%monster) $char(%monster  $+ _pokemon)

    if ($readini($char($nick), Taming_Monster, NaturalArmor-Name) != $null) {

      var %taming.armor.name $readini($char($nick), Taming_Monster, NaturalArmor-Name)
      var %taming.armor.Max $readini($char($nick), Taming_Monster, NaturalArmor-Max)

      writeini $char(%monster  $+ _pokemon) NaturalArmor Name %taming.armor.name
      writeini $char(%monster  $+ _pokemon) NaturalArmor Max %taming.armor.Max
      writeini $char(%monster  $+ _pokemon) NaturalArmor Current %taming.armor.Max

    }
    var %taming.name $readini $char($nick) Taming_Monster Name
    var %taming.hp $readini $char($nick) Taming_Monster HP
    var %taming.tp $readini $char($nick) Taming_Monster TP
    var %taming.str $readini $char($nick) Taming_Monster Str
    var %taming.def $readini $char($nick) Taming_Monster Def
    var %taming.int $readini $char($nick) Taming_Monster Int
    var %taming.spd $readini $char($nick) Taming_Monster Spd
    var %taming.ig $readini $char($nick) Taming_Monster IgnitionGauge

    writeini $char(%monster $+ _pokemon) BaseStats HP %taming.hp
    writeini $char(%monster $+ _pokemon) BaseStats Name %taming.name
    writeini $char(%monster $+ _pokemon) BaseStats TP %taming.tp
    writeini $char(%monster $+ _pokemon) BaseStats Str %taming.str
    writeini $char(%monster $+ _pokemon) BaseStats Def %taming.def
    writeini $char(%monster $+ _pokemon) BaseStats int %taming.int
    writeini $char(%monster $+ _pokemon) BaseStats Spd %taming.spd
    writeini $char(%monster $+ _pokemon) BaseStats IgnitionGauge %taming.ig

    writeini $char(%monster $+ _pokemon) Battle HP %taming.hp
    writeini $char(%monster $+ _pokemon) Battle TP %taming.tp
    writeini $char(%monster $+ _pokemon) Battle Str %taming.str
    writeini $char(%monster $+ _pokemon) Battle Def %taming.def
    writeini $char(%monster $+ _pokemon) Battle int %taming.int
    writeini $char(%monster $+ _pokemon) Battle Spd %taming.spd
    writeini $char(%monster $+ _pokemon) Battle IgnitionGauge %taming.ig

    if ($readini($char(%monster $+ _pokemon), info, flag) = monster) { writeini $char(%monster $+ _pokemon) info flag npc }
    writeini $char(%monster $+ _pokemon) BaseState Name Pokemon %monster



    set %curbat $readini($txtfile(battle2.txt), Battle, List)
    %curbat = $addtok(%curbat,%monster $+ _pokemon,46)
    writeini $txtfile(battle2.txt) Battle List %curbat
    write $txtfile(battle.txt) %monster $+ _pokemon

    if ($readini($char(%monster $+ _pokemon), info, flag) = npc) {

      if (%battle.type = ai) {
        var %total.players $readini($txtfile(battle2.txt), BattleInfo, Players)
        inc %total.players 1
        writeini $txtfile(battle2.txt) BattleInfo Players %total.players
      }

    }

    writeini $txtfile(battle2.txt) style $1 $+ .lastaction ThrowPoke

    if (%portal.bonus != true) { writeini $char(%monster $+ _pokemon) info FirstTurn true }

    ; Initialize the action points 
    $action.points(%monster $+ _pokemon, initialize)

    $skill.nextturn.check(ThrowPoke, $nick)

  }
}
