/obj/structure/boatbell
	name = "колокол"
	desc = "Тяжёлый бронзовый колокол на причале."
	icon = 'icons/roguetown/misc/structure.dmi'
	icon_state = "bell"
	density = FALSE
	max_integrity = 0
	anchored = TRUE
	var/last_ring
	var/datum/looping_sound/boatloop/soundloop

/obj/structure/boatbell/Initialize()
	soundloop = new(list(src), FALSE)
	soundloop.start()
	. = ..()

/obj/structure/boatbell/attack_hand(mob/user)
	if(world.time < last_ring + 50)
		return
	user.visible_message("<span class='info'>[user] звонит в колокол.</span>")
	SSshuttle.moveShuttle("supply", "supply_away", TRUE)
	playsound(src, 'sound/misc/boatbell.ogg', 100, extrarange = 5)
	last_ring = world.time

/obj/structure/boatbell/fluff/attack_hand(mob/user)
	if(world.time < last_ring + 50)
		return
	user.visible_message("<span class='info'>[user] звонит в колокол.</span>")
	playsound(src, 'sound/misc/boatbell.ogg', 100, extrarange = 5)
	last_ring = world.time

/obj/structure/boatbell/escape
	desc = "Этот челн возвещает гибель Рогтауна. Звон колокола неизбежно посеет панику, ведь многие страшатся участи большинства пограничных поселений без хозяина."
	var/bribe = 0
	var/bribeprice = 500

/obj/structure/boatbell/escape/Initialize()
	bribeprice = rand(300,700)
	. = ..()


/obj/structure/boatbell/escape/attackby(obj/item/P, mob/user, params)
	if(!user.cmode)
		if(istype(P, /obj/item/roguecoin) || istype(P, /obj/item/roguegem))
			bribe += P.get_real_price()
			qdel(P)
			if(bribe >= bribeprice)
				to_chat(user, "<span class='warning'>Этого должно хватить.</span>")
			playsound(loc, 'sound/misc/machinevomit.ogg', 100, TRUE, -1)
			return
	..()

/obj/structure/boatbell/escape/attack_hand(mob/user)
	if(world.time < last_ring + 50)
		return
	last_ring = world.time
	user.visible_message("<span class='info'>[user] начинает звонить в колокол.</span>")
	for(var/i in 1 to rand(1,5))
		playsound(src, 'sound/misc/boatbell.ogg', 100, extrarange = 5)
		if(!do_after(user, 30, target = src))
			return
	var/realbribe = bribeprice - (round(((world.time - SSticker.round_start_time) / 9000))*100)
	if(user.mind)
		if(user.mind.has_antag_datum(/datum/antagonist/skeleton))
			realbribe = 0
	if(bribe < realbribe)
		to_chat(user, "<span class='warning'>Недостаточно монет, чтобы заставить перевозчиков нарушить расписание.</span>")
		return
//	SSshuttle.requestEvac(user, href_list["call"])
	if(SSshuttle.emergency.mode != SHUTTLE_DOCKED)
		return
	if(SSshuttle.emergency.earlyLaunch == TRUE)
		SSshuttle.emergency.earlyLaunch = FALSE
//		SSshuttle.emergency.setTimer(max(SSshuttle.emergency.startTime + ROUNDTIMERBOAT - world.time, 5 MINUTES))
		//announce delayed
		priority_announce("Последняя лодка задерживается.")
	else
		if(SSshuttle.emergency.timer < 5 MINUTES)
			priority_announce("Последняя лодка задерживается.")
		else
			priority_announce("Последняя лодка отплывает раньше времени.", null, 'sound/misc/boatleave.ogg')
		SSshuttle.emergency.earlyLaunch = TRUE
		SSshuttle.emergency.setTimer(5 MINUTES)
//	SSshuttle.moveShuttle("supply", "supply_away", TRUE)
//	playsound(src, 'sound/misc/boatbell.ogg', 100, extrarange = 5)

