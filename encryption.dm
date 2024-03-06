// Encryption function
client/proc/encrypt(message)
	var/tmp/key = winget(src, "encryptionkey", "text")  // Get the encryption key from the input element
	var/keyLength = length(key)
	var/encrypted = ""

	// Get the player's ckey
	var/ckey = src.ckey

	// Append the ckey to the message before encryption
	message = ckey + ":" + message

	for (var/i = 1 to length(message))
		var/char = copytext(message,i,i)
		var/keyChar = copytext(key,i % keyLength,i % keyLength + 1)
		var/encryptedChar = chr(ord(char) + ord(keyChar))
		encrypted += encryptedChar
		return encrypted

// Decryption function
client/proc/decrypt(encrypted as text)
	var/tmp/key = winget(src, "encryptionkey", "text")  // Get the encryption key from the input element
	var/keyLength = length(key)
	var/decrypted = ""

	for (var/i = 1 to length(encrypted))
		var/char = copytext(encrypted,i,i)
		var/keyChar = copytext(key,i % keyLength,i % keyLength + 1)
		var/decryptedChar = chr(ord(char) - ord(keyChar))
		decrypted += decryptedChar

	return validate(decrypted)


// Validation function
client/proc/validate(decrypted)
	// Find the position of the first colon
	var/colonPos = findtext(decrypted, ":")

	// Check if a colon is found and extract the ckey
	if (colonPos > 0)
		var/ckey = copytext(decrypted, 1, colonPos - 1)

		// Check if the ckey is valid and belongs to a player currently on the server
		if (locate(ckey, GetAllClientsConnected()))
			return copytext(decrypted, colonPos + 1, length(decrypted))  // Return decrypted message without ckey
		else
			return "<font color='darkred' size='7'>" + decrypted + "</font>"
	else
		return "<font color='darkred' size='7'>" + decrypted + "</font>"

// Decryption function (automatically runs on message receive)
client/proc/NewMessage(message as text)
	set name = ".ManualDecode"
	var/decryptedMessage = validate(message)
	world.log << "Received Encrypted Message: " << decryptedMessage
	return 1

// Say verb for sending an encrypted message to the world
client/verb/sayEncrypted(target as null|mob, text as text)
	set name = "Say"
	var/encryptedMessage = encrypt(text)
	world << "[encryptedMessage] " << src.ckey << ": " << encryptedMessage
	return 1
