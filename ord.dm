// ChatGPT is stupid and hasn't heard of the built-in text2ascii and ascii2text functions, so lets just humor it.
proc/ord(char as text)
	return text2ascii(char)
proc/chr(asciival as num)
	return ascii2text(asciival)