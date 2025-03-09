I. INTRODUCTION

	This is a basic charcater sheet for Dungeons & Dragons 5th Edition. The
	character sheet was developed in HTML, CSS, and JavaScript for local use by
	Reddit users u/nevertras, u/ConDar15, and u/BackFromOtterSpace (primary
	author of this version).

	The original versions are accessible via this Reddit post on r/dndnext:
	https://www.reddit.com/r/dndnext/comments/6b8gv5/5e_character_sheet_with_pure_htmlcss/

II. USAGE

	The character sheet is accessed by opening index.html in the Web_UI folder.
	A shortcut has been provided for convenience. Note that the shortcut has
	only been tested on Windows 7. If this shortcut does not work, you can also
	create your own shortcut to index.html and place it wherever you like.

	The Character sheet has been tested with Google Chrome and Firefox. It does
	not work with Internet Explorer and has not been tested in Microsoft Edge.
	Saved characters can be loaded from any location, but a folder "Characters"
	is provided for convenience.

	The files in the Web_UI folder (index.html, style.css, and script.js) must
	remain in the same folder. They can be moved from the Web_UI folder or the
	Web_UI folder can be renamed, but this will break the shortcut in the main
	directory.

III. ATTRIBUTES AND HIT POINTS

	Attribute modifiers are calculated automatically whenever attribute values
	are updated, but the modifiers can also be overwritten manually. If you make
	a mistake with the modifiers, you can edit the attribute value and the
	modifier will be recalculated automatically. Skill and saving throw
	modifiers must be calculated manually! This is due to the complexities in
	these checks, particularly when accounting for half-proficiency, expertise,
	or magic items.

	Proficiency bonus is calculated automatically based on level (even beyond
	level 20) but can be overwritten separately.

IV. LONG REST FUNCTIONALITY

	The Long Rest button resets hit points and hit dice to the maximum and
	resets all spell slots and pact slots. Players will need to track limit use
	items/abilities, temporary hit points, and other effects or conditions
	themselves.

V. SAVING AND LOADING CHARACTERS

	When the player presses the "Save Character" button, the browser will
	download a JSON document with the extension ".dnd" to the downloads folder.
	These characters can be loaded into the sheet with the "Load Character"
	button. Character sheets can be loaded from anywhere on the local machine,
	but a "Characters" folder is provided for convenience. By default, the file
	will be named "Charcater Name.dnd" with the name of the character as written
	in the character sheet. If no name is provided, the file will be named
	"CharacterSheet.dnd".

	If "Autosave" is chekced, character sheets are automatically downloaded
	before closing the browser window or before loading a new character sheet.