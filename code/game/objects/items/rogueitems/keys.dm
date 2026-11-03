
/obj/item/roguekey
	name = "ключ"
	desc = "Обычный металлический ключ."
	icon_state = "iron"
	icon = 'icons/roguetown/items/keys.dmi'
	lefthand_file = 'icons/mob/inhands/misc/food_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/misc/food_righthand.dmi'
	w_class = WEIGHT_CLASS_TINY
	dropshrink = 0.75
	throwforce = 0
	var/lockhash = 0
	var/lockid = null
	slot_flags = ITEM_SLOT_HIP|ITEM_SLOT_MOUTH|ITEM_SLOT_NECK

/obj/item/roguekey/Initialize()
	. = ..()
	if(lockid)
		if(GLOB.lockids[lockid])
			lockhash = GLOB.lockids[lockid]
		else
			lockhash = rand(100,999)
			while(lockhash in GLOB.lockhashes)
				lockhash = rand(100,999)
			GLOB.lockhashes += lockhash
			GLOB.lockids[lockid] = lockhash
	else if(!lockhash)
		qdel(src)

/obj/item/roguekey/lord
	name = "главный ключ"
	desc = "Особый ключ, способный подойти ко многим замкам."
	icon_state = "bosskey"
	lockid = "lord"

/obj/item/roguekey/lord/pre_attack(target, user, params)
	. = ..()
	if(istype(target, /obj/structure/closet))
		var/obj/structure/closet/C = target
		if(C.masterkey)
			lockhash = C.lockhash
	if(istype(target, /obj/structure/mineral_door))
		var/obj/structure/mineral_door/D = target
		if(D.masterkey)
			lockhash = D.lockhash


/obj/item/roguekey/manor
	name = "ключ от поместья"
	icon_state = "mazekey"
	lockid = "manor"

/obj/item/roguekey/garrison
	name = "ключ городской стражи"
	icon_state = "spikekey"
	lockid = "garrison"

/obj/item/roguekey/dungeon
	name = "ключ от темницы"
	icon_state = "rustkey"
	lockid = "dungeon"

/obj/item/roguekey/vault
	name = "ключ от хранилища"
	icon_state = "cheesekey"
	lockid = "vault"

/obj/item/roguekey/sheriff
	name = "ключ бейлифа"
	icon_state = "cheesekey"
	lockid = "sheriff"

/obj/item/roguekey/merchant
	name = "ключ торговца"
	icon_state = "cheesekey"
	lockid = "merchant"

/obj/item/roguekey/shop
	name = "ключ от лавки"
	icon_state = "ekey"
	lockid = "shop"

/obj/item/roguekey/tavern
	name = "ключ от таверны"
	icon_state = "hornkey"
	lockid = "tavern"

/obj/item/roguekey/roomi
	name = "ключ от комнаты I"
	icon_state = "brownkey"
	lockid = "roomi"

/obj/item/roguekey/roomii
	name = "ключ от комнаты II"
	icon_state = "brownkey"
	lockid = "roomii"

/obj/item/roguekey/roomiii
	name = "ключ от комнаты III"
	icon_state = "brownkey"
	lockid = "roomiii"

/obj/item/roguekey/roomiv
	name = "ключ от комнаты IV"
	icon_state = "brownkey"
	lockid = "roomiv"

/obj/item/roguekey/roomv
	name = "ключ от комнаты V"
	icon_state = "brownkey"
	lockid = "roomv"

/obj/item/roguekey/roomvi
	name = "ключ от комнаты VI"
	icon_state = "brownkey"
	lockid = "roomvi"

/obj/item/roguekey/roomhunt
	name = "ключ от охотничьей комнаты"
	icon_state = "brownkey"
	lockid = "roomhunt"

//vampire mansion//
/obj/item/roguekey/vampire
	name = "ключ от особняка"
	icon_state = "vampkey"
	lockid = "mansionvampire"
//

/obj/item/roguekey/blacksmith
	name = "ключ кузнеца"
	icon_state = "brownkey"
	lockid = "blacksmith"

/obj/item/roguekey/walls
	name = "ключ от городских стен"
	icon_state = "rustkey"
	lockid = "walls"

/obj/item/roguekey/church
	name = "ключ от церкви"
	icon_state = "brownkey"
	lockid = "priest"

/obj/item/roguekey/priest
	name = "ключ священника"
	icon_state = "cheesekey"
	lockid = "hpriest"

/obj/item/roguekey/tower
	name = "ключ от башни"
	icon_state = "greenkey"
	lockid = "tower"

/obj/item/roguekey/mage
	name = "ключ мага"
	icon_state = "eyekey"
	lockid = "mage"

/obj/item/roguekey/graveyard
	name = "ключ от склепа"
	icon_state = "rustkey"
	lockid = "graveyard"

/obj/item/roguekey/mason
	name = "ключ каменщика"
	icon_state = "brownkey"
	lockid = "mason"

/obj/item/roguekey/nightman
	name = "ключ ночного мастера"
	icon_state = "greenkey"
	lockid = "nightman"

/obj/item/roguekey/nightmaiden
	name = "ключ ночной девы"
	icon_state = "brownkey"
	lockid = "nightmaiden"

/obj/item/roguekey/mercenary
	name = "ключ наёмника"
	icon_state = "greenkey"
	lockid = "merc"

/obj/item/roguekey/puritan
	name = "ключ пуританина"
	icon_state = "mazekey"
	lockid = "puritan"

/obj/item/roguekey/confession
	name = "ключ от исповедальни"
	icon_state = "brownkey"
	lockid = "confession"

/obj/item/roguekey/hand
	name = "ключ десницы"
	icon_state = "cheesekey"
	lockid = "hand"

/obj/item/roguekey/steward
	name = "ключ управляющего"
	icon_state = "cheesekey"
	lockid = "steward"

/obj/item/roguekey/archive
	name = "ключ от архива"
	icon_state = "ekey"
	lockid = "archive"
//grenchensnacker
/obj/item/roguekey/porta
	name = "странный ключ"
	icon_state = "eyekey"
	lockid = "porta"
