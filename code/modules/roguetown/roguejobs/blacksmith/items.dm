
/obj/item/roguestatue
	icon = 'icons/roguetown/items/valuable.dmi'
	name = "статуя"
	desc = "Искусно отлитая статуя."
	icon_state = ""
	w_class = WEIGHT_CLASS_NORMAL
	smeltresult = null

/obj/item/roguestatue/gold
	name = "золотая статуя"
	desc = "Тяжёлая статуя из чистого золота."
	icon_state = "gstatue1"
	smeltresult = /obj/item/ingot/gold
	sellprice = 120

/obj/item/roguestatue/gold/Initialize()
	. = ..()
	icon_state = "gstatue[pick(1,2)]"

/obj/item/roguestatue/gold/loot
	name = "золотая статуэтка"
	desc = "Небольшая статуэтка из золота."
	icon_state = "lstatue1"
	sellprice = 45

/obj/item/roguestatue/gold/loot/Initialize()
	. = ..()
	sellprice = rand(45,100)
	icon_state = "lstatue[pick(1,2)]"

/obj/item/roguestatue/silver
	name = "серебряная статуя"
	desc = "Изящная статуя из серебра."
	icon_state = "sstatue1"
	smeltresult = /obj/item/ingot/silver
	sellprice = 90

/obj/item/roguestatue/silver/Initialize()
	. = ..()
	icon_state = "sstatue[pick(1,2)]"

/obj/item/roguestatue/steel
	name = "стальная статуя"
	desc = "Массивная статуя из стали."
	icon_state = "ststatue1"
	smeltresult = /obj/item/ingot/steel
	sellprice = 60

/obj/item/roguestatue/steel/Initialize()
	. = ..()
	icon_state = "ststatue[pick(1,2)]"

/obj/item/roguestatue/iron
	name = "железная статуя"
	desc = "Грубая кованая статуя из железа."
	icon_state = "istatue1"
	smeltresult = /obj/item/ingot/iron
	sellprice = 40

/obj/item/roguestatue/iron/Initialize()
	. = ..()
	icon_state = "istatue[pick(1,2)]"


//000000000000000000000000000--

/obj/item/roguegear
	icon = 'icons/roguetown/items/misc.dmi'
	name = "шестерня"
	desc = "Зубчатая шестерня для соединения механизмов."
	icon_state = "gear"
	w_class = WEIGHT_CLASS_SMALL
	smeltresult = null
	var/obj/structure/linking

/obj/item/roguegear/Destroy()
	if(linking)
		linking = null
	. = ..()

/obj/item/roguegear/attack_self(mob/user)
	if(linking)
		linking = null
		to_chat(user, "<span class='warning'>Привязка остановлена.</span>")
		return

/obj/item/roguegear/attack_obj(obj/O, mob/living/user)
	if(!istype(O, /obj/structure))
		return ..()
	var/obj/structure/S = O
	if(linking)
		if(linking == O)
			to_chat(user, "<span class='warning'>Нельзя привязать механизм к самому себе.</span>")
			return
		if(linking in S.redstone_attached)
			to_chat(user, "<span class='warning'>Уже привязано.</span>")
			linking = null
			return
		S.redstone_attached |= linking
		linking.redstone_attached |= S
		linking = null
		to_chat(user, "<span class='notice'>Привязка завершена.</span>")
		return
	else
		linking = S
		to_chat(user, "<span class='info'>Привязка началась...</span>")
		return
	..()
