on 1:join:#AiroRPG: {
  if ($exists($char($nick)) == $false) { 
    msg $chan Willkommen $nick zum ActionRPG AiroRPG wenn du neu bist und das Tutorial starten möchtest so schreibe 4(7!tut-ger4] für ein Deutsches Tutorial
    msg $chan Welcome $nick to the ActionRPG AiroRPG if you are a new player and you want to start the tutorial for you so type 4(7!tut-en4) for the english tutorial
    msg $chan Good luck for you.....  Remember the main language in this game is english only the tutorial are in German and English and the wiki is only in german language.
    msg $chan if you have a Problem with the game you can ask in english or german. Have Fun. <3
  }
}

on 1:text:!tut-ger:#: { 
  writeini $char($nick) Info Tutorial on
  var %tut $readini($char($nick), Info, Tutorial)
  if ($exists($char($nick)) == $true) && (%tut == on) {
    msg $nick Hallo $nick und Herzlich willkommen zum Deutschen Tutorial zu AiroRPG.
    play $nick Tut-ger-start.txt
  }
}
on 1:text:!tut-en:#: { 
  writeini $char($nick) Info Tutorial on
  var %tut $readini($char($nick), Info, Tutorial)
  if ($exists($char($nick)) == $true) && (%tut == on) {
    msg $nick Hello $nick and Welcome to the Tutorial for AiroRPG.
    play $nick Tut-en-start.txt
  }
}
on 1:text:!tut-ger-char:?: { 
  var %tut $readini($char($nick), Info, Tutorial)
  if ($exists($char($nick)) == $true) && (%tut == on) {
    play $nick Tut-ger-char.txt
  }
}
on 1:text:!tut-en-char:?: { 
  var %tut $readini($char($nick), Info, Tutorial)
  if ($exists($char($nick)) == $true) && (%tut == on) {
    play $nick Tut-en-char.txt
  }
}
on 1:text:!tut-ger-pass:?: { 
  var %tut $readini($char($nick), Info, Tutorial)
  if ($exists($char($nick)) == $true) && (%tut == on) {
    msg $nick Du hast also zuvor deinen Nicknamen Angelegt und viele Infos bekommen sei nicht verwirrt auf dieser Seite werden sie erklärt:
    msg $nick https://game.igame-rpg.de/docu/index.php?title=Start-_und_Charakterbefehle
    msg $nick Das Passwort ist notwendig, um dich später mittels !id beim Spiel zu identifizieren zu können.
    msg $nick Dieses solltest du nun ändern:
    msg $nick 7Schritt 1: Schreibe nun !newpassword altespasswort neuespasswort (Anmerkung, das Passwort wurde dir per PN mitgeteilt und ist anstelle von altespasswort zu setzen, der wert neuespasswort kann von dir frei bestimmt werden).
    msg $nick Wenn alles geklappt hat, bekommst du eine Bestätigungsnachricht.
    msg $nick Nun werden dir einige Grundbefehle erklärt schreibe dazu bitte 4(7!tut-ger-grund4) um zum nächsten Schritt zu kommen.
  }
}
on 1:text:!tut-en-pass:?: { 
  var %tut $readini($char($nick), Info, Tutorial)
  if ($exists($char($nick)) == $true) && (%tut == on) {
    msg $nick So you have previously created your nickname and got a lot of info don't get confused on this page they are explained:
    msg $nick https://game-igame--rpg-de.translate.goog/docu/index.php?title=Start-_und_Charakterbefehle&_x_tr_sl=de&_x_tr_tl=en&_x_tr_hl=de&_x_tr_pto=wapp
    msg $nick The password is necessary to log in later using !id to be identified during the game.
    msg $nick You should change this:
    msg $nick 7Step 1: Write now !newpassword oldpass newpass (Note, the password was communicated to you via PM and is to be set instead of oldpassword, the value of newpassword can be freely determined by you).
    msg $nick If everything went well, you will receive a confirmation message.
    msg $nick Some basic commands will now be explained to you. Please write about them 4(7!tut-en-grund4) to get to the next step.
  }
}
on 1:text:!tut-ger-grund:?: { 
  var %tut $readini($char($nick), Info, Tutorial)
  if ($exists($char($nick)) == $true) && (%tut == on) {
    msg $nick Du hast das Passwort und die Charaktererstellung abgeschlossen und alles Verstanden?
    msg $nick Falls nicht kannst du hier nochmal nachsehen: https://game.igame-rpg.de/docu/index.php?title=Start-_und_Charakterbefehle
    msg $nick Nun erhälst du eine Liste der GrundBefehle die du gerne mal ausprobieren kannst:
    play $nick tut-ger-grund.txt
    msg $nick Willst du weiter zum nächsten Schrit "Dein Profil" so schreibe 4(7!tut-ger-profile4)
  }
}
on 1:text:!tut-en-grund:?: { 
  var %tut $readini($char($nick), Info, Tutorial)
  if ($exists($char($nick)) == $true) && (%tut == on) {
    msg $nick You have completed the password and character creation and understood everything?
    msg $nick If not, you can check here again: https://game-igame--rpg-de.translate.goog/docu/index.php?title=Start-_und_Charakterbefehle&_x_tr_sl=de&_x_tr_tl=en&_x_tr_hl=de&_x_tr_pto=wapp
    msg $nick Now you get a list of basic commands that you are welcome to try:
    play $nick tut-en-grund.txt
    msg $nick Do you want to continue to the next step "Your profile" so write 4(7!tut-en-profile4)
  }
}
on 1:text:!tut-ger-profile:?: { 
  var %tut $readini($char($nick), Info, Tutorial)
  if ($exists($char($nick)) == $true) && (%tut == on) {
    msg $nick Du weißt nun einige Grundbefehle und bist bereit dir mal dein Profil anzusehen so schreibe doch ganz einfach mal
    msg $nick 7!mystats Na zuviel information ? keine sorge ich erkläre dir jeden Wert:
    play $nick tut-ger-prof.txt
    /timer1 1 21 msg $nick Hast du alles verstanden und möchtest nun deine Werte HP STR DEF INT SPD IG etc hochschrauben so gehe zum nächsten Schritt
    /timer1b 1 21 msg $nick Schreibe also nun 7!tut-ger-shop.
  }
}
on 1:text:!tut-en-profile:?: { 
  var %tut $readini($char($nick), Info, Tutorial)
  if ($exists($char($nick)) == $true) && (%tut == on) {
    msg $nick You now know some basic commands and are ready to take a look at your profile, so just write
    msg $nick 7!mystats Too much information? Don't worry, I'll explain every value to you:
    play $nick tut-en-prof.txt
    /timer1 1 21 msg $nick Have you understood everything and now want to increase your values HP STR DEF INT SPD IG etc. go to the next step
    /timer1b 1 21 msg $nick write now 7!tut-en-shop.
  }
}
on 1:text:!tut-ger-shop:?: { 
  var %tut $readini($char($nick), Info, Tutorial)
  if ($exists($char($nick)) == $true) && (%tut == on) {
    msg $nick Du hast dir nun dein Profil angeschaut und möchtest gerne deine Grundwerte erhöhen?
    msg $nick Dies geht in unserem IngameShop den man mittels Befehl 7!ishop aufrufen kann.
    msg $nick Hierbei solltest du einiges beachten:
    play $nick Shop-info.txt
  }
}
on 1:text:!tut-en-shop:?: { 
  var %tut $readini($char($nick), Info, Tutorial)
  if ($exists($char($nick)) == $true) && (%tut == on) {
    msg $nick You have now looked at your profile and would like to increase your basic values?
    msg $nick This can be done in our ingame shop using the command7!ishop
    msg $nick You should pay attention to a few things here:
    play $nick Shop-info-en.txt
  }
}
on 1:text:!tut-ger-w-t:*: { 
  var %tut $readini($char($nick), Info, Tutorial)
  if ($exists($char($nick)) == $true) && (%tut == on) {
    msg $nick Da du nun weist wie du deine Werte erhöhen kannst möchte ich dir nun erklären wie es sich mit Waffen verhält.
    msg $nick und wie du eine Kaufst etc.
    play $nick waffeninfo.txt
  }
}
on 1:text:!tut-en-w-t:*: { 
  var %tut $readini($char($nick), Info, Tutorial)
  if ($exists($char($nick)) == $true) && (%tut == on) {
    msg $nick Now that you know how to increase your values, I would like to explain how it works with weapons.
    msg $nick and how to buy one etc.
    play $nick waffeninfo-en.txt
  }
}
on 1:text:!tut-ger-Skills:*: { 
  var %tut $readini($char($nick), Info, Tutorial)
  if ($exists($char($nick)) == $true) && (%tut == on) {
    msg $nick Im Letzten Teil haben wir uns eine Waffe gekauft und ausgerüstet. Nun wollen wir für diese Skills und Techniken kaufen.
    msg $nick Was ist zu beachten:
    play $nick skills.txt
  }
}
on 1:text:!tut-en-Skills:*: { 
  var %tut $readini($char($nick), Info, Tutorial)
  if ($exists($char($nick)) == $true) && (%tut == on) {
    msg $nick In the last part we bought and equipped a weapon. Now let's buy for these skills and techniques.
    msg $nick What is to be considered:
    play $nick skills-en.txt
  }
}
on 1:text:!tut-ger-Styles:*: { 
  var %tut $readini($char($nick), Info, Tutorial)
  if ($exists($char($nick)) == $true) && (%tut == on) {
    play $nick styles.txt
  }
}
on 1:text:!tut-en-Styles:*: { 
  var %tut $readini($char($nick), Info, Tutorial)
  if ($exists($char($nick)) == $true) && (%tut == on) {
    play $nick styles-en.txt
  }
}
on 1:text:!tut-ger-Kampf:*: { 
  var %tut $readini($char($nick), Info, Tutorial)
  if ($exists($char($nick)) == $true) && (%tut == on) {
    play $nick Kampf.txt
  }
}
on 1:text:!tut-en-battle:*: { 
  var %tut $readini($char($nick), Info, Tutorial)
  if ($exists($char($nick)) == $true) && (%tut == on) {
    play $nick Kampf-en.txt
  }
}
