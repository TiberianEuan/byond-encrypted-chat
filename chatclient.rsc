?   �Zl���e���e   interface.dmf macro "macro"
	elem 
		name = "Center+REP"
		command = ".center"
	elem 
		name = "Northeast+REP"
		command = ".northeast"
	elem 
		name = "Southeast+REP"
		command = ".southeast"
	elem 
		name = "Southwest+REP"
		command = ".southwest"
	elem 
		name = "Northwest+REP"
		command = ".northwest"
	elem 
		name = "West+REP"
		command = ".west"
	elem 
		name = "North+REP"
		command = ".north"
	elem 
		name = "East+REP"
		command = ".east"
	elem 
		name = "South+REP"
		command = ".south"


menu "menu"
	elem 
		name = "&File"
		command = ""
		saved-params = "is-checked"
	elem 
		name = "&Quit"
		command = ".quit"
		category = "&File"
		saved-params = "is-checked"


window "default"
	elem "default"
		type = MAIN
		pos = 372,0
		size = 1422x891
		anchor1 = -1,-1
		anchor2 = -1,-1
		background-color = #202124
		is-transparent = true
		is-default = true
		saved-params = "pos;size;is-minimized;is-maximized"
		title = "Probably Secure BYOND Chat Client"
		macro = "macro"
		menu = "menu"
		outer-size = 1440x985
		inner-size = 1422x913
	elem "encryptionkey"
		type = INPUT
		pos = 1262,669
		size = 156x220
		anchor1 = 89,75
		anchor2 = 100,100
		text-color = #cc3300
		background-color = #22252c
		is-default = true
		saved-params = ""
		is-password = true
		no-command = true
	elem "output1"
		type = OUTPUT
		pos = 0,-1
		size = 1423x658
		anchor1 = 0,0
		anchor2 = 100,74
		background-color = #202124
		is-default = true
		saved-params = "max-lines"
		enable-http-images = true
	elem "info1"
		type = INFO
		pos = -5,657
		size = 1259x229
		anchor1 = 0,74
		anchor2 = 89,100
		text-color = #f8f8f8
		background-color = #202124
		is-default = true
		saved-params = ""
		tab-text-color = #ffffff
		tab-background-color = #303132

