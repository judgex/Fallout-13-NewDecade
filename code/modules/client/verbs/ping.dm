/client/verb/update_ping(time as num)
	set instant = TRUE
	set name = ".update_ping"
	var/ping = pingfromtime(time)
	lastping = ping
	if (!avgping)
		avgping = ping
	else
		avgping = MC_AVERAGE_SLOW(avgping, ping)

/client/proc/pingfromtime(time)
	return ((world.time+world.tick_lag*world.tick_usage/100)-time)*100

/client/verb/display_ping(time as num)
	set instant = TRUE
	set name = ".display_ping"
	to_chat(src, "<span class='notice'>Ваш текущий пинг [round(pingfromtime(time),1)]ms</span>")

/client/verb/ping()
	set name = "Проверить пинг"
	set category = "OOC"
	winset(src, null, "command=.display_ping+[world.time+world.tick_lag*world.tick_usage/100]")