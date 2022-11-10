# Shin Megami Tensei (J1.0) disassembly
Far from complete, but published so others may use it as they see fit.

I can be found on Discord as kan#7240 either on the ALTTP Randomizer server (you can ping me in the #off-topic channel) or on the [Shin Megami Tensei Randomizer server](https://discord.gg/FZsX6HPZw5) for the 0 people that need to contact me about contributing to this.

## Some notes
* The beginning of every line will have an address label of the form `#_AAAAAA:`, where `AAAAAA` is the 24-bit address in ROM in hexadecimal. The `#` prevents the label from creating a new hierarchy. The `_` is required as labels may not begin with numbers.
* Lines contain 1 instruction each.
* For data bank and direct page changes, the full address will be written out.
* In data tables, the number of entries per line is determined by how they should logically be grouped. In all other cases, they are grouped in sets of four or eight.
* The MVN and MVP instructions are written with a macro so that writing them in the standard way assembles correctly.
* The original developers appear to have overwritten the same disk for each new build, leaving a lot of unused code and data in random places. In some cases, this vestigial code will reference a ROM location that no longer contains what it did when that code was relevant. When this happens, the operands or pointers in this disassembly will be literal values instead of labels.
* The 4 player-named characters will use the names I played with throughout the disassembly. They are:
  * Protagonist: Chase
  * Female protagonist: Momo
  * Lawful hero: Jimmy
  * Chaotic hero: "him"

## Special thanks
* Aikiomik for [their independent documentation of this disassembly](https://github.com/akiomik/smt1-note), which provided useful material for me to borrow.