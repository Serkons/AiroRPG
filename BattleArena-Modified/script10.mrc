on 3:text:!!repairHQ:#: {
  if (%battleis == off) && (%battleisopen == off) && ($exists($char($nick)) == $true) {
    ;Check if enoug time is passing for this
    ; Uncommented while testing
    ;var %player.lastRepair $readini($char($nick), info, LastRepairHQ)
    ; var %time.difference.HQ $calc($ctime - %player.lastRepair)
    ;var %repairHQ.time.setting 1800
    ;if ((%time.difference.HQ = $null) || (%time.difference.HQ < %repairHQ.time.setting)) { 
    ;$display.message($readini(translation.dat, errors, DragonHunt.Can'tHunt2), private)
    ;halt 
    ;}

    ; Write the time the user has RepairedHQ
    ;writeini $char($nick) info LastRepairHQ $ctime

    ;Check for the needed Items to repair the HQ
    var %metalplate $readini($char($nick), Item_Amount, MetalPlate)
    var %screw $readini($char($nick), Item_Amount, Screw)
    var %met-need 1
    var %screw-need 4
    if (%metalplate <= %met-need) && (%screw <= %screw-need) || (%screw == 0) { msg $chan not enough Metalplates and screws to repair the generator | halt }
    if (%metalplate >= %met-need) && (%screw >= %screw-need) {
      var %hq-Gen-HP 20000
      var %current.metalplates $readini($char($nick), Item_Amount, MetalPlate)
      var %current.screw $readini($char($nick), Item_Amount, Screw)
      var %current.HQ-Gen-HP $readini($npc(HQ-Generator), Battle, HP)
      var %plate-HP 500 
      var %newgenhp $calc(%current.HQ-Gen-HP + %plate-HP)
      if (%newgenhp <= %hq-Gen-hp) {
        dec %current.metalplates 1
        dec %current.screw 4
        writeini $char($nick) Item_Amount MetalPlate %current.metalplates
        writeini $char($nick) Item_Amount Screw %current.screw
        writeini $npc(HQ-Generator) Battle HP %newgenhp
      }
      if (%newgenhp >= %hq-Gen-hp) {
        msg $chan Sorry dont geht over the limit of %hq-gen-hp 
      }
    }

    ;check the percentage of the hp max hp and post it
    var %hq-Gen-HP 40000
    var %HQ-EnergygeneratorHP $readini($npc(HQ-Generator), Battle, HP)
    var %percent-HQ $round($calc(%HQ-EnergygeneratorHP / %hq-Gen-HP * 100),0) $+ %
    msg $chan der HQ Genertor ist zu %percent-HQ aufgeladen.

    ;start the event if Generator is fully repaired.
    $hq-gen.check
  }
  else {
    msg $chan sorry only outside
  }
}
