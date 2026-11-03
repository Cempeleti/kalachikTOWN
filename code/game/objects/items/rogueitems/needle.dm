
/obj/item/needle
	name = "игла"
	icon_state = "needle"
	desc = "Швейная игла с нитью для зашивания ран и починки одежды."
	icon = 'icons/roguetown/items/misc.dmi'
	lefthand_file = 'icons/mob/inhands/misc/food_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/misc/food_righthand.dmi'
	w_class = WEIGHT_CLASS_TINY
	force = 0
	throwforce = 0
	var/stringamt = 10
	resistance_flags = FLAMMABLE
	slot_flags = ITEM_SLOT_MOUTH
	max_integrity = 20


/obj/item/needle/examine()
	. = ..()
	. += "<span class='bold'>Осталось использований: [stringamt].</span>"

/obj/item/needle/New()
	..()
	update_icon()

/obj/item/needle/update_icon()
	cut_overlays()
	if(stringamt)
		add_overlay("[icon_state]string")
	..()

/obj/item/needle/use(used)
	stringamt = stringamt - used
	if(stringamt <= 0)
		qdel(src)

/obj/item/needle/attack(mob/living/M, mob/user)
	sew(M, user)

/obj/item/needle/attack_obj(obj/O, mob/living/user)
	if(isitem(O))
		var/obj/item/I = O
		if(I.sewrepair && I.max_integrity && !I.obj_broken)
			if(I.obj_integrity == I.max_integrity)
				to_chat(user, "<span class='warning'>Это не сломано.</span>")
				return
			if(user.mind.get_skill_level(/datum/skill/misc/sewing) < I.required_repair_skill)
				to_chat(user, "<span class='warning'>Я не умею это чинить...</span>")
				return
			if(!I.ontable())
				to_chat(user, "<span class='warning'>Сначала нужно положить это на стол.</span>")
				return
			playsound(loc, 'sound/foley/sewflesh.ogg', 100, TRUE, -2)
			var/sewtime = 70
			if(user.mind)
				sewtime = (70 - ((user.mind.get_skill_level(/datum/skill/misc/sewing)) * 10))
			if(do_after(user, sewtime, target = I))
				playsound(loc, 'sound/foley/sewflesh.ogg', 100, TRUE, -2)
				user.visible_message("<span class='info'>[user] чинит [I]!</span>")
				I.obj_integrity = I.max_integrity
				return

/obj/item/needle/proc/sew(mob/living/M, mob/user)
	if(!get_location_accessible(M, check_zone(user.zone_selected)))
		to_chat(user, "<span class='warning'>Что-то мешает.</span>")
		return
	if(!ishuman(M))
		return
	var/mob/living/carbon/human/H = M
	var/obj/item/bodypart/affecting = H.get_bodypart(check_zone(user.zone_selected))
	if(!H.mind)
		return
	if(!affecting)
		return
	if(affecting.bandage)
		to_chat(user, "<span class='warning'>Здесь уже есть повязка.</span>")
		return
	var/list/sewable = affecting.get_sewable()
	if(!sewable || !sewable.len)
		to_chat(user, "<span class='warning'>Здесь нет ран, требующих зашивания.</span>")
		return
	var/datum/wound/W = input(user, "Какую рану зашить?", "KalachikTOWN", name) as null|anything in sortList(sewable)
	if(!W)
		return
	if(!W || !W.can_sew)
		return
	if(do_after(user, 20))
		playsound(loc, 'sound/foley/sewflesh.ogg', 100, TRUE, -2)
		var/moveup = 10
		if(user.mind)
			moveup = (((user.mind.get_skill_level(/datum/skill/misc/medicine)) * 30) + moveup)
		W.progress = min(W.progress + moveup, 100)
		if(W.progress == 100)
			W.sewn()

		H.update_damage_overlays()

		if(M == user)
			user.visible_message("<span class='notice'>[user] зашивает [W.name] на себе.</span>", "<span class='notice'>Я зашиваю [W.name] на своём [affecting].</span>")
		else
			user.visible_message("<span class='notice'>[user] зашивает [W.name] на [affecting] [M].</span>", "<span class='notice'>Я зашиваю [W.name] на [affecting] [M].</span>")
		log_combat(user, H, "sew", "needle")
		if(prob(50))
			use(1)

/obj/item/needle/thorn
	name = "игла из шипа"
	icon_state = "thornneedle"
	desc = "Примитивная швейная игла, сделанная из острого растительного шипа с нитью."
	stringamt = 3
