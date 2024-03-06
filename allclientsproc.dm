proc/GetAllClientsConnected()
	var/list/clients = new/list()
	for(var/client/C)
		clients.Add(C.ckey)