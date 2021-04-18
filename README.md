# FINSDK

An (unofficial) bash-powered build system and software development kit for the Ficsit-Networks Satisfactory mod. FINSDK aims to make writing code for FIN computers easier by allowing you to work in your favourite code editor and deploy code across many computers at once with simple bash commands.

## What is this?

This is a build system to develop and manage larger codebases for Ficsit-Networks (FIN) in your favourite text editor to to deploy code to many FIN computers at once with ease.

Ficsit-Networks is a mod for Satisfactory that allows players to build in-game computers that can execute Lua code in order to automate things, take user input, display graphics, and generally make factories more scriptable.

Editing Lua code using the in-game interface provided by the mod is manageable for small scripts, but as a codebase grows the need for better editing tools becomes apparent. Whether it's because you have many computers running Lua and its difficult to update each one manually,  FINSDK is meant to bridge that gap.

FINSDK offers a simple set of tools to edit FIN computer code in your favourite text editor. When you're ready to test your code, you can easily push it to Satisfactory and see the changes in action without reloading the game. All you need is a bash terminal and a text editor.

- [A brief introduction to what FIN is capable of](https://www.youtube.com/watch?v=EtybEOkgJ4o)
- [Ficsit-Networks on Satisfactory Mod Library](https://ficsit.app/mod/8d8gk4imvFanRs)
- **[Visit the Ficsit-Networks Discord](https://discord.gg/3VfZ6Da)**

## What do I need?

Before beginning, I recommend spending some time to learn the basics of Ficsit-Networks without any tooling. It's important to understand the concepts! [This video](https://www.youtube.com/watch?v=EtybEOkgJ4o) is a decent primer, but I **strongly recommend** spending some time with FIN in-game before jumping into using FINSDK.

You'll need:

- Satisfactory
- The Ficsit-Networks mod
- ~450 Crystal Oscillators, some silica, a few computers & a few circuit boards
- Your favourite text editor
- A bash (or compatible) terminal

Your OS of choice *shouldn't* matter for the purposes of using this tool, so long as you can run a bash terminal.

If you're running Windows (and I assume most people are on their gaming rig), there are 2 options I can recommend to get a bash terminal running:

1. [Install Git and use git bash](https://git-scm.com/download/win) -- This is easy and if you're looking at github, you may already have it
2. [Set up WSL and run bash/zsh](https://github.com/DigitalMachinist/win-zsh) -- This is more work but its the best terminal I've ever set up in Windows

This SDK should work fine in both of these terminals and probably other bash-for-Windows configurations as well, but I can't test all of them so YMMV. If some modifications are needed to make this work in your configuration of choice, feel free to submit a PR.

## Getting Started

[Read the getting started guide](./docs/getting_started.md)

## Documentation

[Read the complete docs](./docs/README.md)

## Misc

- Editor stuff?
- VSCode extension recommendations?
- Helpful but unnecessary commands
- Pitfalls/gotchas?
  - No easy way to get drive UUIDs other than printing them from computers
- Identifying the UUID of a drive using a computer

## Roadmap/Issues

- [x] Add a flag to `push` to force overwrite data files
- [x] Move library functions to namespaces
- [x] Add comment docblocks to library functions
- [ ] Include storage controller example
- [ ] build all
- [ ] build & push
- [ ] remove app
- [ ] rename app
- [ ] Explain Satisfactory computers folder loads computers for current save file only and managing multiple save files is fun
- [ ] Clean up `eeprom.lua`
- [ ] Compile EEPROM files into a single file? Same with app files? Is it possible to work out function order?
- [ ] Better handling of data --no-clobber (don't pull then delete then replace --> preserve data folders as they are instead)
- [ ] Friendly drive names
- [ ] EEPROM auto-update that doesn't suck

This is a *very* rudimentary approach to building Lua applications, but its productive and it works for making things in FIN.
