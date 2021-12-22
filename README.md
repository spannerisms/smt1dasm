# Shin Megami Tensei (J1.0) disassembly
Far from complete, but published so others may use it as they see fit.

I can be found on the ALTTP Randomizer Discord as kan#7240 (you can ping me in the #general-dev or #off-topic channels) for the 0 people that need to contact me about contributing to this.

## Some notes
* The beginning of every line will have an address label of the form `#_AAAAAA:`, where `AAAAAA` is the 24-bit address in ROM in hexadecimal. The `#` prevents the label from creating a new hierarchy. The `_` is required as labels may not begin with numbers.
* Lines contain 1 instruction each.
* For data bank and direct page changes, the full address will be written out.
* In data tables, the number of entries per line is determined by how they should logically be grouped. In all other cases, they are grouped in sets of four or eight.
* The MVN and MVP instructions are written with a macro so that writing them in the standard way assembles correctly.
* The 4 player-named characters will use the names I played with throughout the disassembly. They are:
  * Protagonist: Chase
  * Female protagonist: Momo
  * Lawful hero: Jimmy
  * Chaotic hero: "him"
