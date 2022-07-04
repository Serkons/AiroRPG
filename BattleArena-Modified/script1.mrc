on *:text:!Readfile:#: {

  set %a $read $mircdir $+ txts\armor.txt
  /msg $chan Hi: $read(armor.txt)
}

on 1:text:!heal*:#: {
  set %pmd $readini(system.dat, system,PlayersMustDieMode)
  if (%battleis == on) && (%pmd == true) {
    if ($isfile($char($nick)) == $true) && ($2 == $null) {
      msg # Heilung nur auserhalb möglich.
      halt
    }
    if ($isfile($char($nick)) == $false) && ($2 == $null) {
      msg # Sry einen Nichtvorhandenen Spieler kann ich nicht helfen.
    }
    if ($isfile($char($nick)) == $true) && ($2 isnum) {
      msg # Heilung nur auserhalb möglich.
      halt
    }
    if ($isfile($char($nick)) == $false) && ($2 isnum) {
      msg # Sry einen Nichtvorhandenen Spieler kann ich nicht helfen.
    }
    if ($isfile($char($nick)) == $true) && ($2 !isnum) {
      msg # Heilung nur auserhalb möglich.
      halt
    }
    if ($isfile($char($nick)) == $false) && ($2 !isnum) {
      msg # Sry einen Nichtvorhandenen Spieler kann ich nicht helfen.
    }
  }
  if (%battleis == off) && (%pmd == true) {
    if ($isfile($char($nick)) == $true) && ($2 == $null) {
      var %mainhp $readini($char($nick), BaseStats, HP)
      var %enoughorbs $round($readini($char($nick), Stuff, redorbs),0)
      if (%enoughorbs >= %mainhp) {
        var %currentorbs $calc(%enoughorbs - %mainhp)
        writeini $char($nick) Stuff redorbs %currentorbs
        writeini $char($nick) Battle HP %mainhp
        msg # Heilung ist auserhalb möglich. Die Max HP die Geheilt wird beträgt %mainhp . Du hast zurzeit %enoughorbs RedOrbs. Du bezahlst %mainhp und hast dann noch übrig %currentorbs  
      }
    }
    if ($isfile($char($nick)) == $true) && ($2 isnum) {
      var %valheal $2
      var %mainhp $readini($char($nick), BaseStats, HP)
      if (%valheal > %mainhp) { 
        msg # Fehler du kannst dich nicht über die MaxHP heilen
        halt
      }
      if (%valheal <= %mainhp) {
        var  %currenthp $readini($char($nick), Battle, hp)
        var  %healcount $calc(%currenthp + %valheal)
        if (%healcount > %mainhp)  {
          msg # Sry %healcount ist größer als %mainhp
        }
        if (%healcount <= %mainhp) {
          var %enoughorbs $readini($char($nick), Stuff, redorbs)
          var %currentorbs $round($calc(%enoughorbs - %healcount),0)
          if (%enoughorbs >= %healcount) {
            writeini $char($nick) Stuff redorbs %currentorbs
            writeini $char($nick) Battle HP %healcount
            msg # Du hast dich um %healcount HP Punkten geheilt und bezahltest %valheal RedOrbs dafür. Deine Übrigen orbs sind dann %currentorbs .
          }
        }
      }
      if ($isfile($char($nick)) == $false) && ($2 isnum) {
        msg # Sry einen Nichtvorhandenen Spieler kann ich nicht helfen.
      }
      if ($isfile($char($nick)) == $false) && ($2 !isnum) {
        msg # Sry einen Nichtvorhandenen Spieler kann ich nicht helfen.
      }
    }
  }
}
