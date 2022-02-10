# Metal Slader Glory: Spanish Translation
## About
This repository contains the source code including the tools to compile the translation of Metal Slader Glory for the Famicom.
The source code is a modified version of the original made by FCandChill, the code was especifically made for the Spanish translation
but it could be modify to create other translation.

## Folders
* asm
	* Contains the asm files which are to be compiled with xkas
    * There's also asm patch files that are commented out in the Write.bat script.
        * `Seizure.asm`: Reduces the color contrast for scenes with intense flashing. I'm not 100% sure if this patch will prevent seizures.
        * `SlowSpeed.asm`: Reduces the text speed. The mouth speed was never sped back up. Additionally, certain scene's music cues will be off. Consider this incomplete.
        * `Metal_Slader_Palettes-Password_Orange.asm`: This increase the contrast on the password screen's highlighting. In the words of jekuthiel:
            > (Just looked at BETA3 on real hardware + CRT.)
            > 1) Greyscale vertical lines are not a problem on NES via composite.  Colored ones are.  So changing the color of a letter to that red highlight color causes it to look "gappy".  In your defense, this is also a problem in the original Japanese version of the game.  However, because the English alphabet has a lot more vertical lines in it, the effect is magnified.  This may or may not have been the kind of thing that Hal would've caught if they had done the localization themselves.
            > 2) The dark red makes the letter very hard to read against the dark green background.
         	* ***In other words, this patch is a must if you're playing on actual hardware.***
* lua
    * Some lua scripts.
        * Mouth: This was used to debug the asm patch that slows the mouths down after implementing the patch to increase the text speed.
        * Text Id Displayer: Does what the name implies
* roms
	* Use this to store your roms
	* Apply the beat patch named Expand.bps
		* Dumps online commonly have an incorrect header which indicate the game uses a battery backup when it does not. Change `0x6` from `$52` to `$50` to correct this. The header should be as follows before patching:
		* `4E 45 53 1A 20 40 50 00 00 00 00 00 00 00 00 00`
* script
	* Contains the dump script in Script.json. It contains the Japanese script and the English translation.
	* You can also store xlsx backups of the script here.
* tables
	* Contains table files
		* Files prefixed with "CHR" specify byte to character mapping.
		* Files prefixed with "Dictionary" specify dictionary mapping. A dictionary can be mapped to multiple character values.
		* Files prefixed with "SquishyText" do some find and replace functions
			* "SquishyText - New.tbl" replaces character patterns to be in one tile. For example, "ll" is converted to the character "[ll]".
			* "SquishyText - Original.tbl" merges the dakuten and handakuten diacritics into the Japanese characters to form a single character. The game is weird about diactrics. For one, the diactrics appear before the character they belong to. Also, dictionaries can contain diactrics that aren't associated with a character in the dictionary itself. This means we can't simply specify "が" in a table file, but apply the conversation after the script has been dumped.
		* Files with "Length" let you specify how wide, in pixels, characters are. This affects `spiro.exe`'s autolinebreaking logic. For a game without VWF, most characters should have a length of `8`. 
* tools
	* cyproAce
		* A script editor 
	* spiro
		* Script dumper and inserter
	* xkas
		* Applies the assembly patches

## Instructions
The tools are coded in C#. You'll have to mess with Wine if you want them to run in Linux. You'll also have to rewrite the bat files, which aren't complicated at all.

* If you want to dump the script for whatever reason (the Japanese and English script are already included in this repository), you can dump it by executing the bat file "Dump.bat" by double clicking it.
* To generate an NES rom file with the translation and patches included:
  * Apply the Expand.bps patch to a Japanese rom, rename the result to "Metal Slader Glory (J) (Trans).nes", and place it in the roms folder. (This should probably be handled by xkas...)
  * Execute the bat file "Write.bat" by double clicking it.

### Translation Notes
If "Value is too big or too small for UInt32." is displayed, just uncomment "%SpiroFolder%\Spiro.exe" /PathToCyproFolder "%projectFolder%" /Write /Verbose.
This is a problem with the script that it could be related to the animations or the character isn't in the table. It will display the numbers of the dialogue,
and it will stop in the number of the dialogue that it has the mistake.

The complete instructions are in https://github.com/romh-acking/metal-slader-glory-fc-en

## Support the Creator
If you like the work of Yoshimiru, you can support him by buying some Metal Slader Glory merch or by following him on Twitter:
  * Store: https://mc-berrys.booth.pm/
   
  * Twitter: https://twitter.com/yoshimiru_SS/

## Changelog
* 11th February 2022:
  * Initial release

## Credits
### Original work
* FCandChill
  * ASM work
  * Utilities
  * Localizer
  * Proofreader
  * Manual
* Her-saki
  * Advanced ASM work 
  * Font
  * Initial translation
### Spanish Tranlation
* FCandChill
* Max1323
  * Spanish tranlation
  * Manual in Spanish
  * Tester
