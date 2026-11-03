/////////////////////////////////////////Scrying///////////////////

/obj/item/scrying
	name = "шар предвидения"
	desc = "Хрустальный шар, в клубящемся тумане которого можно узреть далёкие видения."
	icon = 'icons/roguetown/items/misc.dmi'
	icon_state ="scrying"
	throw_speed = 3
	throw_range = 7
	throwforce = 15
	damtype = BURN
	force = 15
	hitsound = 'sound/blank.ogg'
	sellprice = 30
	dropshrink = 0.6

	var/mob/current_owner
	var/last_scry


/obj/item/scrying/attack_self(mob/user)
	. = ..()
	if(world.time < last_scry + 30 SECONDS)
		to_chat(user, "<span class='warning'>Я всматриваюсь в шар, но вижу лишь чернильный дым. Стоит подождать.</span>")
		return
	var/input = stripped_input(user, "Кого вы ищете?", "Шар предвидения")
	if(!input)
		return
	if(!user.key)
		return
	if(world.time < last_scry + 30 SECONDS)
		to_chat(user, "<span class='warning'>Я всматриваюсь в шар, но вижу лишь чернильный дым. Стоит подождать.</span>")
		return
	if(!user.mind || !user.mind.do_i_know(name=input))
		to_chat(user, "<span class='warning'>Я не знаю никого с таким именем.</span>")
		return
	for(var/mob/living/carbon/human/HL in GLOB.human_list)
		if(HL.real_name == input)
			var/turf/T = get_turf(HL)
			if(!T)
				continue
			var/mob/dead/observer/screye/S = user.scry_ghost()
			if(!S)
				return
			S.ManualFollow(HL)
			last_scry = world.time
			user.visible_message("<span class='danger'>[user] вглядывается в [src], закатив глаза к небу.</span>")
			addtimer(CALLBACK(S, /mob/dead/observer/.proc/reenter_corpse), 8 SECONDS)
			if(!HL.stat)
				if(HL.STAPER >= 15)
					if(HL.mind)
						if(HL.mind.do_i_know(name=user.real_name))
							to_chat(HL, "<span class='warning'>Я отчётливо вижу лицо [user.real_name], пристально смотрящее на меня!</span>")
							return
					to_chat(HL, "<span class='warning'>Я отчётливо вижу лицо неизвестн[user.gender == FEMALE ? "ой женщины" : "ого мужчины"], пристально смотрящее на меня!</span>")
					return
				if(HL.STAPER >= 11)
					to_chat(HL, "<span class='warning'>Я чувствую на себе чужой пристальный взгляд.</span>")
			return
	to_chat(user, "<span class='warning'>Я вглядываюсь в шар, но не могу найти [input].</span>")
	return

/////////////////////////////////////////Crystal ball ghsot vision///////////////////

/obj/item/crystalball/attack_self(mob/user)
	user.visible_message("<span class='danger'>[user] вглядывается в [src], закатив глаза к небу.</span>")
	user.ghostize(1)