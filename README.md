# Donald Land (NES) Disassembly

![](https://i.imgur.com/ISqTEpt.png) ![](https://i.imgur.com/mL2Ez8f.png)

This repository holds a complete disassembly of Donald Land, an obscure NES game about Ronald McDonald (called Donald in Japan) saving his friends from unrelated enemies. Apparently it is the very first licensed McDonald's game.
I found out about this game in the 7th entry of the [Dream Team Contest](http://tasvideos.org/forum/viewtopic.php?t=20463), a TASing contest held in [TASVideos](http://tasvideos.org), and you can see the results [here](http://tasvideos.org/forum/viewtopic.php?p=477835#477835).

During the contest I mostly did a research about the game's RAM, studied how the level data is formatted, and catalogued a bunch of other stuff. Also, this disassembly was born, thanks to [Raidenthequick](https://github.com/Raidenthequick), who disassembled it for me as request so I could understand some game mechanics at code level. I did some commentary on the code, but it's still very crude.

I intend to work more on this in the future, and I hope that someone find this as interesting as I do to work on it too.

# Lua script for BizHawk

![](https://i.imgur.com/70l59Uh.png)

This repository also will be the home of the script I developed to work on the contest and to research in general. This script was developed and test on BizHawk v2.2.2.

It displays most of the basic info to TAS this game: player info (coordinates, speeds and states), sprite info (coordinates, speeds, states, timers and hitboxes), level info, general game info, and some misc info for TASing. It has a funciontal options menu to enable/disable all these options, and it has a cheats feature, to facilitate testing and research.
