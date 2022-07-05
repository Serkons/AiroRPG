# AiroRPG
An RPG Fighting Simulator written in the Mirc language. Main and Base Scriptfiles from here: https://github.com/Iyouboushi/mIRC-BattleArena - Modified by Serkons

Where can i play?
You can Play this modified BattleArena Version on esper.net in the channel #AiroRPG



::::::::::::::::::::::::::::::::::::::
Some Stuff that added by me (Serkons)
:::::::::::::::::::::::::::::::::::::
- A new item type has been added: Infected. This type should be consumed with caution when used in battle.
These items have a 25% chance of healing, a 45% chance of dealing damage, and anything above that can turn you into a zombie or poison you. The current one that does this is: ZombieBrain. Others will follow.
- A new type of boss fight has been added: ZombieKings Army Here the players have to face off against a zombie king and his henchmen. This fight appears on a win streak of over 80+
- Added a new special boss fight: Protect The Powercrystal. During this event, a crystal is created that is attacked by monsters and bosses and must be defended. The loss of this battle is not exactly positive. 40% of the time the spies report the state of the crystal if it has a critical value before the event begins.
- New command: @create mon <nameofmonster> This allows players to create their own monsters/bosses/npcs without having much programming knowledge. Instructions in English are included in the game itself
- Added the !go command. So that you can force the start of the game and no longer have to wait for others.
- Added !heal command. This only works in PMD mode and serves as a healing.
So you use !heal num (so num is the amount of hp you want to heal)
- New item added: ZombieBrain
- New Monsters added
- New Bosses Added
- New Dungeon Added: Rakna-Kadaki
- A new skill was added "Taming" With this active skill by entering the !taming <monstername> there is now a 10% chance of taming this monster if it has less than 30% of the maximum life points.
This skill requires an item called "EmptyPokeball". If successful, a PoweredPokeball is created with the monster's stats
- Added new item "PokeData-Clear" With this item it is possible to clear the data of the Powered Pokeball in order to tame a new monster.
- Added new ItemType "Taiming". These items can be used to level up the Pokemon's stats please use as follows !using Itemnmame
- Added new skill "ThrowPoke" This skill uses the PoweredPokeball to summon the monster stored in it. Command is !throwpoke
- Added new command "!tameItems". This command lists the items needed to level up the Pokemon. If you own these
- Added IncreaseLimitGauge option for power boosts. When set, a limit can increase a user's gauge by an amount specified in the power boost via LimitGaugeIncrease
- Added Bonus Chest Event. After 15 minutes an event will be announced in which you can open one of the 3 chests to get the content. - Write !chest <num> where num is the number of the chest.
- New message when a fight is won The KillCoins that you earn are now also reported
- New: "Procedural Armor Generation" = At ​​the end of a normal monster fight there is a 25% chance to generate an armor chest that randomly distributes the contents to 1-2 players. (Untested)
- New: "Normal dungeons are now also generated at 3% in normal fights. These dungeons have a chest room whose contents are distributed to random players.
- You now also gain a pair of orbs by killing a monster
- New status effect "bleed". Some kind of bleeding status
- New Untested Event: "Protect the HQ-Generator". To Start the Event you must collect Some parts of Materials you need screws and metal plates if you have some you can type !repairHQ. If the Generator is fully repaired the event starts.

:::::::::::::::::::::::::::::::::::::::::::::
Stuff that was changed by (Serkons)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

- Changed the damage message for Normal Attacks and Technique Attacks to send the monster's remaining HP.
- Changed the message at the start of a battle to show what items can be found on the battlefield when using Scavenge.
- The actual TurnMessage was populated with some information eg. Level, Attributes, Armor, Owned Techs and Drops
- When generating the monsters, it is now checked whether there is a SuperElite or Armored in the name and these monsters randomly receive natural armor, which makes them difficult to defeat.
- Added a procendural value to the healthbar. Makes taming monsters easier.
- !mystats has been changed to show Pokemon stats as well.
- Changed technique '''SkullBreaker''', '''Skullbreaker''' now does a Direct Critical Hit if the target was previously Stunned by the attacker. only the attacker can direct crit hit the target no others. Well Others can crit hit them with other skills
- Changed weather information and battlefield information during battle.
- The turn message now also shows the dungeon room if you are in one
- Drops now appear even if the monster is killed with a 25% chance
- Multiple objects in a battlefield are now generated.

;;;;;;;;;;;;;;;;;;;;
fixes by (Serkos)
;;;;;;;;;;;;;;;;;;;;;;

- Fixed a minor bug where the execution of the skill ''!throwpoke''' didn't transition to the next turn. The reason was that I 2) forgot to define 2 variables.
