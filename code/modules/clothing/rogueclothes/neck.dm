/obj/item/clothing/neck/roguetown
	name = "ожерелье"
	desc = "Украшение на шею."
	icon = 'icons/roguetown/clothing/neck.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/neck.dmi'
	bloody_icon_state = "bodyblood"

/obj/item/clothing/neck/roguetown/coif
	name = "койф"
	desc = "Плотный тканевый подшлемник, защищающий голову и шею."
	icon_state = "coif"
	item_state = "coif"
	flags_inv = HIDEEARS|HIDEHAIR
	slot_flags = ITEM_SLOT_NECK|ITEM_SLOT_HEAD
	blocksound = SOFTHIT
	body_parts_covered = NECK|HAIR|EARS|HEAD
	armor = list("melee" = 12, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	adjustable = CAN_CADJUST
	toggle_icon_state = TRUE

/obj/item/clothing/neck/roguetown/coif/AdjustClothes(mob/user)
	if(loc == user)
		if(adjustable == CAN_CADJUST)
			adjustable = CADJUSTED
			if(toggle_icon_state)
				icon_state = "[initial(icon_state)]_t"
			flags_inv = null
			body_parts_covered = NECK
			if(ishuman(user))
				var/mob/living/carbon/H = user
				H.update_inv_neck()
				H.update_inv_head()
		else if(adjustable == CADJUSTED)
			ResetAdjust(user)
			flags_inv = HIDEEARS|HIDEHAIR
			if(user)
				if(ishuman(user))
					var/mob/living/carbon/H = user
					H.update_inv_neck()
					H.update_inv_head()



/obj/item/clothing/neck/roguetown/chaincoif
	name = "кольчужный койф"
	desc = "Капюшон из стальных колец для защиты головы и шеи."
	icon_state = "chaincoif"
	item_state = "chaincoif"
	flags_inv = HIDEEARS|HIDEHAIR
	armor = list("melee" = 15, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

	max_integrity = 200
	resistance_flags = FIRE_PROOF
	slot_flags = ITEM_SLOT_NECK|ITEM_SLOT_HEAD
	body_parts_covered = NECK|HAIR|EARS|HEAD
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_BLUNT)
	adjustable = CAN_CADJUST
	toggle_icon_state = TRUE
	blocksound = CHAINHIT
	smeltresult = /obj/item/ingot/steel

/obj/item/clothing/neck/roguetown/chaincoif/AdjustClothes(mob/user)
	if(loc == user)
		if(adjustable == CAN_CADJUST)
			adjustable = CADJUSTED
			if(toggle_icon_state)
				icon_state = "[initial(icon_state)]_t"
			flags_inv = null
			body_parts_covered = NECK
			if(ishuman(user))
				var/mob/living/carbon/H = user
				H.update_inv_neck()
				H.update_inv_head()
		else if(adjustable == CADJUSTED)
			ResetAdjust(user)
			flags_inv = HIDEEARS|HIDEHAIR
			if(user)
				if(ishuman(user))
					var/mob/living/carbon/H = user
					H.update_inv_neck()
					H.update_inv_head()


/obj/item/clothing/neck/roguetown/chaincoif/iron
	icon_state = "ichaincoif"

	smeltresult = /obj/item/ingot/iron

/obj/item/clothing/neck/roguetown/bervor
	name = "бувигер"
	desc = "Латный подбородник, защищающий нижнюю часть лица, шею и подбородок."
	icon_state = "bervor"
	flags_inv = HIDEFACIALHAIR
	armor = list("melee" = 100, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

	max_integrity = 300
	resistance_flags = FIRE_PROOF
	slot_flags = ITEM_SLOT_NECK
	body_parts_covered = NECK|EARS|MOUTH|NOSE
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_BLUNT)
	blocksound = PLATEHIT

/obj/item/clothing/neck/roguetown/gorget
	name = "горжет"
	desc = "Стальной воротник для защиты горла и шеи."
	icon_state = "gorget"
	flags_inv = HIDEFACIALHAIR
	armor = list("melee" = 100, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

	max_integrity = 150
	resistance_flags = FIRE_PROOF
	slot_flags = ITEM_SLOT_NECK
	body_parts_covered = NECK
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_BLUNT)
	blocksound = PLATEHIT

/obj/item/clothing/neck/roguetown/psicross/original
	name = "пси-крест"
	desc = "Священный символ в виде железного пси-креста."
	icon_state = "psicrossiron"
	//dropshrink = 0.75
	resistance_flags = FIRE_PROOF
	slot_flags = ITEM_SLOT_NECK|ITEM_SLOT_HIP|ITEM_SLOT_WRISTS
	sellprice = 10
	experimental_onhip = TRUE

/obj/item/clothing/neck/roguetown/psicross/astrata
	name = "амулет Астраты"
	desc = "Священный амулет, посвященный богине Астрате."
	icon_state = "astrata"
	resistance_flags = FIRE_PROOF
	slot_flags = ITEM_SLOT_NECK|ITEM_SLOT_HIP|ITEM_SLOT_WRISTS
	sellprice = 10
	experimental_onhip = TRUE

/obj/item/clothing/neck/roguetown/psicross/noc
	name = "амулет Нока"
	desc = "Темный амулет бога Нока."
	icon_state = "noc"
	resistance_flags = FIRE_PROOF
	slot_flags = ITEM_SLOT_NECK|ITEM_SLOT_HIP|ITEM_SLOT_WRISTS
	sellprice = 10
	experimental_onhip = TRUE

/obj/item/clothing/neck/roguetown/psicross/dendor
	name = "амулет Дендора"
	desc = "Оберег, посвященный богу Дендору."
	icon_state = "dendor"
	resistance_flags = FIRE_PROOF
	slot_flags = ITEM_SLOT_NECK|ITEM_SLOT_HIP|ITEM_SLOT_WRISTS
	sellprice = 10
	experimental_onhip = TRUE

/obj/item/clothing/neck/roguetown/psicross/necra
	name = "амулет Некры"
	desc = "Мрачный амулет культа богини Некры."
	icon_state = "necra"
	resistance_flags = FIRE_PROOF
	slot_flags = ITEM_SLOT_NECK|ITEM_SLOT_HIP|ITEM_SLOT_WRISTS
	sellprice = 10
	experimental_onhip = TRUE

/obj/item/clothing/neck/roguetown/psicross/s
	name = "серебряный пси-крест"
	desc = "Освященный серебряный символ веры. Губителен для нечисти."
	icon_state = "psicross"
	sellprice = 50

/obj/item/clothing/neck/roguetown/psicross/s/funny_attack_effects(mob/living/target, mob/living/user, nodmg)
	. = ..()
	if(ishuman(target))
		var/mob/living/carbon/human/H = target
		if(H.dna && H.dna.species)
			if(istype(H.dna.species, /datum/species/werewolf))
				target.Knockdown(30)
				target.Stun(30)
	if(target.mind && target.mind.has_antag_datum(/datum/antagonist/vampirelord))
		var/datum/antagonist/vampirelord/VD = target.mind.has_antag_datum(/datum/antagonist/vampirelord)
		if(!VD.disguised)
			target.Knockdown(30)
			target.Stun(30)

/obj/item/clothing/neck/roguetown/psicross/s/mob_can_equip(mob/living/M, mob/living/equipper, slot, disable_warning = FALSE, bypass_equip_delay_self = FALSE)
	. = ..()
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		if(H.dna && H.dna.species)
			if(istype(H.dna.species, /datum/species/werewolf))
				return FALSE
	if(M.mind && M.mind.has_antag_datum(/datum/antagonist/vampirelord))
		return FALSE

/obj/item/clothing/neck/roguetown/psicross/g
	name = "золотой пси-крест"
	desc = "Роскошный золотой символ веры."
	icon_state = "psicrossg"
	//dropshrink = 0.75
	resistance_flags = FIRE_PROOF
	sellprice = 100

/obj/item/clothing/neck/roguetown/psicross/necra
	name = "золотой пси-крест"
	desc = ""
	icon_state = "psicrossg"
	//dropshrink = 0.75
	resistance_flags = FIRE_PROOF
	sellprice = 100

/obj/item/clothing/neck/roguetown/psicross/noc
	name = "золотой пси-крест"
	desc = ""
	icon_state = "psicrossg"
	//dropshrink = 0.75
	resistance_flags = FIRE_PROOF
	sellprice = 100

/obj/item/clothing/neck/roguetown/talkstone
	name = "камень связи"
	desc = "Магический камень, позволяющий слышать голос на расстоянии."
	icon_state = "talkstone"
	item_state = "talkstone"
	//dropshrink = 0.75
	resistance_flags = FIRE_PROOF
	sellprice = 98

/obj/item/clothing/neck/roguetown/horus
	name = "око Хоруса"
	desc = "Мистический амулет с изображением всевидящего ока."
	icon_state = "horus"
	//dropshrink = 0.75
	resistance_flags = FIRE_PROOF
	sellprice = 30

/obj/item/clothing/neck/roguetown/shalal
	name = "медаль пустынного всадника"
	desc = "Наградной знак воинов пустыни."
	icon_state = "shalal"
	//dropshrink = 0.75
	resistance_flags = FIRE_PROOF
	sellprice = 15
