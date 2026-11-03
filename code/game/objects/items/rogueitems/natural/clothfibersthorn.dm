/obj/item/natural/fibers
	name = "волокна"
	icon_state = "fibers"
	possible_item_intents = list(/datum/intent/use)
	desc = "Растительные волокна, используемые для плетения и изготовления нитей."
	force = 0
	throwforce = 0
	obj_flags = null
	color = "#454032"
	firefuel = 5 MINUTES
	resistance_flags = FLAMMABLE
	slot_flags = ITEM_SLOT_MOUTH
	max_integrity = 20
	muteinmouth = TRUE
	w_class = WEIGHT_CLASS_TINY
	spitoutmouth = FALSE

/obj/item/natural/fibers/attackby(obj/item/W, mob/living/user)
	var/mob/living/carbon/human/H = user
	if(istype(W, /obj/item/natural/fibers))
		var/obj/item/natural/bundle/fibers/F = new(src.loc)
		H.put_in_hands(F)
		H.visible_message("[user] сплетает волокна в связку.")
		qdel(W)
		qdel(src)
	if(istype(W, /obj/item/natural/bundle/fibers))
		var/obj/item/natural/bundle/fibers/B = W
		if(B.amount <= 5)
			H.visible_message("[user] добавляет [src] в связку.")
			B.amount += 1
			qdel(src)

#ifdef TESTSERVER

/client/verb/bloodnda()
	set category = "DEBUGTEST"
	set name = "bloodnda"
	set desc = ""

	var/obj/item/I
	I = mob.get_active_held_item()
	if(I)
		if(I.return_blood_DNA())
			testing("yep")
		else
			testing("nope")

#endif

/obj/item/natural/cloth
	name = "ткань"
	icon_state = "cloth"
	possible_item_intents = list(/datum/intent/use)
	desc = "Отрез грубой материи, пригодный для перевязки или уборки."
	force = 0
	throwforce = 0
	obj_flags = null
	firefuel = 5 MINUTES
	resistance_flags = FLAMMABLE
	slot_flags = ITEM_SLOT_MOUTH|ITEM_SLOT_HIP
	body_parts_covered = null
	experimental_onhip = TRUE
	var/wet = 0
	max_integrity = 20
	muteinmouth = TRUE
	w_class = WEIGHT_CLASS_TINY
	spitoutmouth = FALSE

/obj/item/natural/cloth/attackby(obj/item/W, mob/living/user)
	var/mob/living/carbon/human/H = user
	if(istype(W, /obj/item/natural/cloth))
		var/obj/item/natural/bundle/cloth/F = new(src.loc)
		H.put_in_hands(F)
		H.visible_message("[user] сворачивает ткань в тюк.")
		qdel(W)
		qdel(src)
	if(istype(W, /obj/item/natural/bundle/cloth))
		var/obj/item/natural/bundle/cloth/B = W
		if(B.amount <= 5)
			H.visible_message("[user] добавляет [src] в тюк.")
			B.amount += 1
			qdel(src)

/obj/item/natural/cloth/examine(mob/user)
	. = ..()
	if(wet)
		. += "<span class='notice'>Она влажная!</span>"

/obj/item/natural/cloth/bandit
	color = "#ff0000"

// CLEANING

/obj/item/natural/cloth/attack_obj(obj/O, mob/living/user)
	testing("attackobj")
	if(user.client && ((O in user.client.screen) && !user.is_holding(O)))
		to_chat(user, "<span class='warning'>Нужно снять [O.name] перед тем, как чистить!</span>")
		return
	if(istype(O, /obj/effect/decal/cleanable))
		var/cleanme = TRUE
		if(istype(O, /obj/effect/decal/cleanable/blood))
			if(!wet)
				cleanme = FALSE
			add_blood_DNA(O.return_blood_DNA())
		if(prob(33 + (wet*10)) && cleanme)
			wet = max(wet-1, 0)
			user.visible_message("<span class='notice'>[user] вытирает [O.name] при помощи [src].</span>", "<span class='notice'>Я вытираю [O.name] при помощи [src].</span>")
			qdel(O)
		else
			user.visible_message("<span class='warning'>[user] вытирает [O.name] при помощи [src].</span>", "<span class='warning'>Я вытираю [O.name] при помощи [src].</span>")
		playsound(user, "clothwipe", 100, TRUE)
	else
		if(prob(30 + (wet*10)))
			user.visible_message("<span class='notice'>[user] вытирает [O.name] при помощи [src].</span>", "<span class='notice'>Я вытираю [O.name] при помощи [src].</span>")

			if(O.return_blood_DNA())
				add_blood_DNA(O.return_blood_DNA())
			for(var/obj/effect/decal/cleanable/C in O)
				qdel(C)
			if(!wet)
				SEND_SIGNAL(O, COMSIG_COMPONENT_CLEAN_ACT, CLEAN_WEAK)
			else
				SEND_SIGNAL(O, COMSIG_COMPONENT_CLEAN_ACT, CLEAN_STRONG)
			wet = max(wet-1, 0)
		else
			user.visible_message("<span class='warning'>[user] вытирает [O.name] при помощи [src].</span>", "<span class='warning'>Я вытираю [O.name] при помощи [src].</span>")
		playsound(user, "clothwipe", 100, TRUE)

/obj/item/natural/cloth/attack_turf(turf/T, mob/living/user)
	if(istype(T, /turf/open/water))
		return ..()
	if(prob(30 + (wet*10)))
		user.visible_message("<span class='notice'>[user] протирает [T.name] при помощи [src].</span>", "<span class='notice'>Я протираю [T.name] при помощи [src].</span>")
		if(wet)
			for(var/obj/effect/decal/cleanable/C in T)
				qdel(C)
			wet = max(wet-1, 0)
	else
		user.visible_message("<span class='warning'>[user] протирает [T.name] при помощи [src].</span>", "<span class='warning'>Я протираю [T.name] при помощи [src].</span>")
	playsound(user, "clothwipe", 100, TRUE)


// BANDAGING
/obj/item/natural/cloth/attack(mob/living/M, mob/user)
	testing("attack")
	bandage(M, user)

/obj/item/natural/cloth/wash_act()
	. = ..()
	wet = 5

/obj/item/natural/cloth/proc/bandage(mob/living/M, mob/user)
	if(!M.can_inject(user, TRUE))
		return
	if(!ishuman(M))
		return
	var/mob/living/carbon/human/H = M
	var/obj/item/bodypart/affecting = H.get_bodypart(check_zone(user.zone_selected))
	if(!affecting)
		return
	if(!get_location_accessible(H, check_zone(user.zone_selected)))
		to_chat(user, "<span class='warning'>Что-то мешает.</span>")
		return
	if(affecting.bandage)
		to_chat(user, "<span class='warning'>Здесь уже есть повязка.</span>")
		return
	var/used_time = 70
	if(H.mind)
		used_time -= (H.mind.get_skill_level(/datum/skill/misc/medicine) * 10)
	playsound(loc, 'sound/foley/bandage.ogg', 100, FALSE)
	if(!do_mob(user, M, used_time))
		return
	playsound(loc, 'sound/foley/bandage.ogg', 100, FALSE)

	user.dropItemToGround(src)
	affecting.try_bandage(src)
	H.update_damage_overlays()

	if(M == user)
		user.visible_message("<span class='notice'>[user] перевязывает своё [affecting].</span>", "<span class='notice'>Я перевязываю своё [affecting].</span>")
	else
		user.visible_message("<span class='notice'>[user] перевязывает [affecting] [M].</span>", "<span class='notice'>Я перевязываю [affecting] [M].</span>")

/obj/item/natural/thorn
	name = "шип"
	icon_state = "thorn"
	desc = "Острый растительный шип."
	force = 10
	throwforce = 0
	possible_item_intents = list(/datum/intent/stab)
	firefuel = 5 MINUTES
	embedding = list("embedded_unsafe_removal_time" = 20, "embedded_pain_chance" = 10, "embedded_pain_multiplier" = 1, "embed_chance" = 35, "embedded_fall_chance" = 0)
	resistance_flags = FLAMMABLE
	max_integrity = 20
/obj/item/natural/thorn/attack_self(mob/living/user)
	user.visible_message("<span class='warning'>[user] ломает [src].</span>")
	playsound(user,'sound/items/seedextract.ogg', 100, FALSE)
	qdel(src)

/obj/item/natural/thorn/Crossed(mob/living/L)
	. = ..()
	if(istype(L))
		var/prob2break = 33
		if(L.m_intent == MOVE_INTENT_SNEAK)
			prob2break = 0
		if(L.m_intent == MOVE_INTENT_RUN)
			prob2break = 100
		if(prob(prob2break))
			playsound(src,'sound/items/seedextract.ogg', 100, FALSE)
			qdel(src)
			L.consider_ambush()

/obj/item/natural/bundle/fibers
	name = "связка волокон"
	icon_state = "fibersroll1"
	possible_item_intents = list(/datum/intent/use)
	desc = "Связка растительных волокон."
	force = 0
	throwforce = 0
	obj_flags = null
	color = "#454032"
	firefuel = 5 MINUTES
	resistance_flags = FLAMMABLE
	slot_flags = ITEM_SLOT_MOUTH
	max_integrity = 20
	muteinmouth = TRUE
	w_class = WEIGHT_CLASS_TINY
	spitoutmouth = FALSE
	var/amount = 2

/obj/item/natural/bundle/cloth
	name = "тюк ткани"
	icon_state = "clothroll1"
	possible_item_intents = list(/datum/intent/use)
	desc = "Свёрнутый в тюк отрез ткани."
	force = 0
	throwforce = 0
	obj_flags = null
	firefuel = 5 MINUTES
	resistance_flags = FLAMMABLE
	w_class = WEIGHT_CLASS_TINY
	spitoutmouth = FALSE
	var/amount = 2


/obj/item/natural/bundle/cloth/examine(mob/user)
	. = ..()
	to_chat(user, "<span class='notice'>Ткани в тюке: [amount]</span>")

/obj/item/natural/bundle/cloth/attackby(obj/item/W, mob/living/user)
	if(istype(W, /obj/item/natural/cloth))
		if(amount >= 10)
			to_chat(user, "В тюке больше нет места.")
			return
		amount += 1
		user.visible_message("[user] добавляет [W] в [src]")
		qdel(W)
	if(istype(W, /obj/item/natural/bundle/cloth))
		var/obj/item/natural/bundle/cloth/B = W
		if(B.amount + amount <= 10)
			user.visible_message("[user] добавляет [B] в [src]")
			amount += B.amount
			qdel(B)
		else
			to_chat(user, "В тюке больше нет места.")
	update_bundle()

/obj/item/natural/bundle/cloth/attack_right(mob/user)
	var/mob/living/carbon/human/H = user
	switch(amount)
		if(2)
			var/obj/item/natural/cloth/F = new (src.loc)
			var/obj/item/natural/cloth/I = new (src.loc)
			H.put_in_hands(F)
			H.put_in_hands(I)
			qdel(src)
			return
		else
			amount -= 1
			var/obj/item/natural/cloth/F = new (src.loc)
			H.put_in_hands(F)
			user.visible_message("[user] вынимает [F] из [src]")
	update_bundle()

/obj/item/natural/bundle/cloth/proc/update_bundle()
	switch(amount)
		if(2 to 5)
			icon_state = "clothroll1"
		if(6 to 10)
			icon_state = "clothroll2"

/obj/item/natural/bundle/fibers/examine(mob/user)
	. = ..()
	to_chat(user, "<span class='notice'>Волокон в связке: [amount]</span>")

/obj/item/natural/bundle/fibers/attackby(obj/item/W, mob/living/user)
	if(istype(W, /obj/item/natural/fibers))
		if(amount >= 6)
			to_chat(user, "В связке больше нет места.")
			return
		amount += 1
		user.visible_message("[user] добавляет [W] в [src]")
		qdel(W)
	if(istype(W, /obj/item/natural/bundle/fibers))
		var/obj/item/natural/bundle/fibers/B = W
		if(B.amount + amount <= 6)
			user.visible_message("[user] добавляет [B] в [src]")
			amount += B.amount
			qdel(B)
		else
			to_chat(user, "В связке больше нет места.")
	update_bundle()

/obj/item/natural/bundle/fibers/attack_right(mob/user)
	var/mob/living/carbon/human/H = user
	switch(amount)
		if(2)
			var/obj/item/natural/fibers/F = new (src.loc)
			var/obj/item/natural/fibers/I = new (src.loc)
			H.put_in_hands(F)
			H.put_in_hands(I)
			qdel(src)
			return
		else
			amount -= 1
			var/obj/item/natural/fibers/F = new (src.loc)
			H.put_in_hands(F)
			user.visible_message("[user] вынимает [F] из [src]")
	update_bundle()

/obj/item/natural/bundle/fibers/proc/update_bundle()
	switch(amount)
		if(1 to 3)
			icon_state = "fibersroll1"
		if(4 to 6)
			icon_state = "fibersroll2"

/obj/item/natural/bundle/stick
	name = "вязанка хвороста"
	icon_state = "stickbundle1"
	possible_item_intents = list(/datum/intent/use)
	desc = "Аккуратно связанный пучок хвороста."
	force = 0
	throwforce = 0
	obj_flags = null
	firefuel = 5 MINUTES
	resistance_flags = FLAMMABLE
	w_class = WEIGHT_CLASS_TINY
	spitoutmouth = FALSE
	var/amount = 2

/obj/item/natural/bundle/stick/examine(mob/user)
	. = ..()
	to_chat(user, "<span class='notice'>Палок в вязанке: [amount]</span>")

/obj/item/natural/bundle/stick/attackby(obj/item/W, mob/living/user)
	if(istype(W, /obj/item/grown/log/tree/stick))
		if(amount >= 7)
			to_chat(user, "В вязанке больше нет места.")
			return
		amount += 1
		user.visible_message("[user] добавляет [W] в [src]")
		qdel(W)
	if(istype(W, /obj/item/natural/bundle/stick))
		var/obj/item/natural/bundle/stick/B = W
		if(B.amount + amount <= 7)
			user.visible_message("[user] добавляет [B] в [src]")
			amount += B.amount
			qdel(B)
		else
			to_chat(user, "В вязанке больше нет места.")
	update_bundle()

/obj/item/natural/bundle/stick/attack_right(mob/user)
	var/mob/living/carbon/human/H = user
	switch(amount)
		if(2)
			var/obj/item/grown/log/tree/stick/F = new (src.loc)
			var/obj/item/grown/log/tree/stick/I = new (src.loc)
			H.put_in_hands(F)
			H.put_in_hands(I)
			qdel(src)
			return
		else
			amount -= 1
			var/obj/item/grown/log/tree/stick/F = new (src.loc)
			H.put_in_hands(F)
			user.visible_message("[user] вынимает [F] из [src]")
	update_bundle()

/obj/item/natural/bundle/stick/proc/update_bundle()
	var/stickfire = (5 * amount)
	firefuel = stickfire MINUTES
	switch(amount)
		if(2 to 3)
			icon_state = "stickbundle1"
		if(4 to 5)
			icon_state = "stickbundle2"
		if(6 to 7)
			icon_state = "stickbundle3"
