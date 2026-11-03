/obj/item/rogueore
	name = "руда"
	desc = "Кусок необработанной руды."
	icon = 'icons/roguetown/items/ore.dmi'
	icon_state = "ore"
	w_class = WEIGHT_CLASS_NORMAL

/obj/item/rogueore/gold
	name = "золотая руда"
	desc = "Кусок руды с прожилками чистого золота."
	icon_state = "oregold"
	smeltresult = /obj/item/ingot/gold
	sellprice = 10

/obj/item/rogueore/silver
	name = "серебряная руда"
	desc = "Кусок руды с блеском серебра."
	icon_state = "oresilv"
	smeltresult = /obj/item/ingot/silver
	sellprice = 8

/obj/item/rogueore/iron
	name = "железная руда"
	desc = "Тяжёлый кусок железной руды."
	icon_state = "oreiron"
	smeltresult = /obj/item/ingot/iron
	sellprice = 5

/obj/item/rogueore/copper
	name = "медная руда"
	desc = "Кусок медной руды с характерным красноватым отливом."
	icon_state = "orecop"
	smeltresult = /obj/item/ingot/copper
	sellprice = 3


/obj/item/rogueore/coal
	name = "уголь"
	desc = "Кусок горючего чёрного угля."
	icon_state = "orecoal"
	firefuel = 60 MINUTES
	smeltresult = /obj/item/rogueore/coal
	sellprice = 1

/obj/item/ingot
	name = "слиток"
	desc = "Отлитый металлический брусок."
	icon = 'icons/roguetown/items/ore.dmi'
	icon_state = "ingot"
	w_class = WEIGHT_CLASS_NORMAL
	smeltresult = null
	var/datum/anvil_recipe/currecipe

/obj/item/ingot/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/rogueweapon/tongs))
		var/obj/item/rogueweapon/tongs/T = I
		if(!T.hingot)
			forceMove(T)
			T.hingot = src
			T.hott = null
			T.update_icon()
			return
	..()

/obj/item/ingot/Destroy()
	if(currecipe)
		QDEL_NULL(currecipe)
	if(istype(loc, /obj/machinery/anvil))
		var/obj/machinery/anvil/A = loc
		A.hingot = null
		A.update_icon()
	..()

/obj/item/ingot/gold
	name = "золотой слиток"
	desc = "Тяжёлый слиток из чистого золота."
	icon_state = "ingotgold"
	smeltresult = /obj/item/ingot/gold
	sellprice = 100

/obj/item/ingot/iron
	name = "железный слиток"
	desc = "Слиток добротного железа."
	icon_state = "ingotiron"
	smeltresult = /obj/item/ingot/iron
	sellprice = 25
/obj/item/ingot/copper
	name = "медный слиток"
	desc = "Слиток очищенной меди."
	icon_state = "ingotcop"
	smeltresult = /obj/item/ingot/copper
	sellprice = 10
/obj/item/ingot/silver
	name = "серебряный слиток"
	desc = "Блестящий слиток чистого серебра."
	icon_state = "ingotsilv"
	smeltresult = /obj/item/ingot/silver
	sellprice = 60
/obj/item/ingot/steel
	name = "стальной слиток"
	desc = "Слиток прочной кованой стали."
	icon_state = "ingotsteel"
	smeltresult = /obj/item/ingot/steel
	sellprice = 40
