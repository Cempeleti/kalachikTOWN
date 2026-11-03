

/obj/item/clothing/ring
	name = "кольцо"
	desc = "Небольшое металлическое кольцо."
	w_class = WEIGHT_CLASS_TINY
	icon = 'icons/roguetown/clothing/rings.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/rings.dmi'
	sleeved = 'icons/roguetown/clothing/onmob/rings.dmi'
	sleevetype = "shirt"
	icon_state = ""
	slot_flags = ITEM_SLOT_RING
	resistance_flags = FIRE_PROOF | ACID_PROOF

/obj/item/clothing/ring/silver
	name = "серебряное кольцо"
	desc = "Изящное кольцо из чистого серебра."
	icon_state = "ring_s"
	sellprice = 33

/obj/item/clothing/ring/gold
	name = "золотое кольцо"
	desc = "Блестящее кольцо из червонного золота."
	icon_state = "ring_g"
	sellprice = 70

/obj/item/clothing/ring/active
	var/active = FALSE
	desc = "Увы, как и большинство магических колец, его силу нужно беречь. (ПКМ для активации)"
	var/cooldowny
	var/cdtime
	var/activetime
	var/activate_sound

/obj/item/clothing/ring/active/attack_right(mob/user)
	if(loc != user)
		return
	if(cooldowny)
		if(world.time < cooldowny + cdtime)
			to_chat(user, "<span class='warning'>Ничего не происходит.</span>")
			return
	user.visible_message("<span class='warning'>[user] поворачивает [src]!</span>")
	if(activate_sound)
		playsound(user, activate_sound, 100, FALSE, -1)
	cooldowny = world.time
	addtimer(CALLBACK(src, .proc/demagicify), activetime)
	active = TRUE
	update_icon()
	activate(user)

/obj/item/clothing/ring/active/proc/activate(mob/user)
	user.update_inv_wear_id()

/obj/item/clothing/ring/active/proc/demagicify()
	active = FALSE
	update_icon()
	if(ismob(loc))
		var/mob/user = loc
		user.visible_message("<span class='warning'>Кольцо затихает.</span>")
		user.update_inv_wear_id()


/obj/item/clothing/ring/active/nomag
	name = "кольцо рассеивания магии"
	desc = "Магическое кольцо с рубином, рассеивающее чары вокруг владельца. (ПКМ для активации)"
	icon_state = "ruby"
	activate_sound = 'sound/magic/antimagic.ogg'
	cdtime = 90 MINUTES
	activetime = 30 SECONDS
	sellprice = 100

/obj/item/clothing/ring/active/nomag/update_icon()
	..()
	if(active)
		icon_state = "rubyactive"
	else
		icon_state = "ruby"

/obj/item/clothing/ring/active/nomag/activate(mob/user)
	. = ..()
	AddComponent(/datum/component/anti_magic, TRUE, FALSE, FALSE, ITEM_SLOT_RING, INFINITY, FALSE)

/obj/item/clothing/ring/active/nomag/demagicify()
	. = ..()
	var/datum/component/magcom = GetComponent(/datum/component/anti_magic)
	if(magcom)
		magcom.RemoveComponent()
