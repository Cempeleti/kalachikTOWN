/obj/item/clothing/shoes/roguetown
	name = "туфли"
	icon = 'icons/roguetown/clothing/feet.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/feet.dmi'
	desc = "Простая обувь."
	gender = PLURAL
	slot_flags = ITEM_SLOT_SHOES
	body_parts_covered = FEET
	sleeved = 'icons/roguetown/clothing/onmob/feet.dmi'
	sleevetype = "leg"
	bloody_icon_state = "shoeblood"
	equip_delay_self = 30
	resistance_flags = FIRE_PROOF

/obj/item/clothing/shoes/roguetown/boots
	name = "тёмные сапоги"
	//dropshrink = 0.75
	color = "#d5c2aa"
	desc = "Высокие сапоги из темной кожи."
	gender = PLURAL
	icon_state = "blackboots"
	item_state = "blackboots"
	armor = list("melee" = 15, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/shoes/roguetown/nobleboot
	name = "сапоги дворянина"
	//dropshrink = 0.75
	color = "#d5c2aa"
	desc = "Изящные сапоги из тонкой темной кожи."
	gender = PLURAL
	icon_state = "nobleboots"
	item_state = "nobleboots"
	armor = list("melee" = 15, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/shoes/roguetown/shortboots
	name = "ботинки"
	color = "#d5c2aa"
	desc = "Удобные кожаные ботинки."
	gender = PLURAL
	icon_state = "shortboots"
	item_state = "shortboots"

/obj/item/clothing/shoes/roguetown/ridingboots
	name = "верховые сапоги"
	color = "#d5c2aa"
	desc = "Прочные высокие сапоги для верховой езды."
	gender = PLURAL
	icon_state = "ridingboots"
	item_state = "ridingboots"

///obj/item/clothing/shoes/roguetown/ridingboots/Initialize()
//	. = ..()
//	AddComponent(/datum/component/squeak, list('sound/foley/spurs (1).ogg'sound/blank.ogg'=1), 50)

/obj/item/clothing/shoes/roguetown/simpleshoes
	name = "туфли"
	desc = "Простые кожаные туфли."
	gender = PLURAL
	icon_state = "simpleshoe"
	item_state = "simpleshoe"
	resistance_flags = null
	color = "#473a30"

/obj/item/clothing/shoes/roguetown/simpleshoes/white
	color = null


/obj/item/clothing/shoes/roguetown/simpleshoes/buckle
	name = "туфли с пряжкой"
	desc = "Кожаные туфли с металлической пряжкой."
	icon_state = "buckleshoes"
	color = null

/obj/item/clothing/shoes/roguetown/simpleshoes/lord
	name = "дворянские туфли"
	desc = "Роскошные туфли из светлой кожи."
	gender = PLURAL
	icon_state = "simpleshoe"
	item_state = "simpleshoe"
	resistance_flags = null
	color = "#cbcac9"

/obj/item/clothing/shoes/roguetown/gladiator
	name = "кожаные сандалии"
	desc = "Сандалии с кожаными ремешками вокруг щиколоток."
	gender = PLURAL
	icon_state = "gladiator"
	item_state = "gladiator"

/obj/item/clothing/shoes/roguetown/sandals
	name = "сандалии"
	desc = "Простые плетеные сандалии."
	gender = PLURAL
	icon_state = "sandals"
	item_state = "sandals"

/obj/item/clothing/shoes/roguetown/shalal
	name = "бабуши"
	desc = "Мягкие туфли без задников с загнутыми носками."
	gender = PLURAL
	icon_state = "shalal"
	item_state = "shalal"

/obj/item/clothing/shoes/roguetown/boots/armor
	name = "латные сапоги"
	desc = "Стальные кованые сапоги, защищающие ступни."
	body_parts_covered = FEET
	icon_state = "armorboots"
	item_state = "armorboots"
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_BLUNT)
	color = null
	blocksound = PLATEHIT
	armor = list("melee" = 100, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/shoes/roguetown/boots/leather
	name = "кожаные сапоги"
	//dropshrink = 0.75
	desc = "Крепкие сапоги из толстой кожи."
	gender = PLURAL
	icon_state = "leatherboots"
	item_state = "leatherboots"
	armor = list("melee" = 15, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/shoes/roguetown/jester
	name = "шутовские башмаки"
	desc = "Нелепые башмаки с бубенчиками на загнутых носках."
	icon_state = "jestershoes"
	resistance_flags = null