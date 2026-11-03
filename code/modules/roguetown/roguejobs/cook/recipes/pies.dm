// meat pies etc
/obj/item/reagent_containers/food/snacks/rogue/pie
	name = "сырой пирог"
	desc = "Сырой пирог перед выпеканием."
	icon = 'icons/roguetown/items/food.dmi'
	icon_state = "pieuncooked"
	list_reagents = list(/datum/reagent/consumable/nutriment = 5)
	tastes = list("pie" = 1)
	filling_color = "#FFFFFF"
	foodtype = GRAIN | DAIRY | SUGAR
	cooked_type = /obj/item/reagent_containers/food/snacks/rogue/pie/cooked
	slices_num = 0
	bitesize = 5
	var/stunning = FALSE
	eat_effect = /datum/status_effect/debuff/uncookedfood

/obj/item/reagent_containers/food/snacks/rogue/pie/cooked
	name = "пирог"
	icon_state = "pie"
	desc = "Ароматный свежевыпеченный пирог с румяной корочкой."
	list_reagents = list(/datum/reagent/consumable/nutriment = 30)
	slice_path = /obj/item/reagent_containers/food/snacks/rogue/pieslice
	slices_num = 6
	slice_batch = TRUE
	warming = 10 MINUTES
	eat_effect = null

/obj/item/reagent_containers/food/snacks/rogue/pie/throw_impact(atom/hit_atom, datum/thrownthing/throwingdatum)
	. = ..()
	if(!.) //if we're not being caught
		splat(hit_atom)

/obj/item/reagent_containers/food/snacks/rogue/pie/proc/splat(atom/movable/hit_atom)
	if(isliving(loc)) //someone caught us!
		return
	var/turf/T = get_turf(hit_atom)
	new/obj/effect/decal/cleanable/food/pie_smudge(T)
	if(reagents && reagents.total_volume)
		reagents.reaction(hit_atom, TOUCH)
	if(isliving(hit_atom))
		var/mob/living/L = hit_atom
		if(stunning)
			L.Paralyze(20) //splat!
		L.adjust_blurriness(1)
		L.visible_message("<span class='warning'>В [L] попадает [src]!</span>", "<span class='danger'>В меня попал [src]!</span>")
	if(is_type_in_typecache(hit_atom, GLOB.creamable))
		hit_atom.AddComponent(/datum/component/creamed, src)
	qdel(src)



/obj/item/reagent_containers/food/snacks/rogue/pie/CheckParts(list/parts_list)
	..()
	for(var/obj/item/reagent_containers/food/snacks/M in parts_list)
		filling_color = M.filling_color
		update_snack_overlays(M)
		color = M.filling_color
		if(M.reagents)
			M.reagents.remove_reagent(/datum/reagent/consumable/nutriment, M.reagents.total_volume)
			M.reagents.trans_to(src, M.reagents.total_volume)
		qdel(M)

/obj/item/reagent_containers/food/snacks/rogue/pieslice
	icon = 'icons/roguetown/items/food.dmi'
	list_reagents = list(/datum/reagent/consumable/nutriment = 5)
	tastes = list("pie" = 1)
	name = "кусок пирога"
	desc = "Аппетитный кусок пирога."
	icon_state = "slice"
	filling_color = "#FFFFFF"
	foodtype = GRAIN | DAIRY | SUGAR
	warming = 10 MINUTES
	bitesize = 3
	eat_effect = /datum/status_effect/buff/foodbuff

/obj/item/reagent_containers/food/snacks/rogue/piedough
	name = "тесто для пирога"
	desc = "Песочное тесто с добавлением сливочного масла."
	icon = 'icons/roguetown/items/food.dmi'
	icon_state = "piedough"
	slices_num = 0
	cooked_type = /obj/item/reagent_containers/food/snacks/rogue/pie/cooked
	list_reagents = list(/datum/reagent/consumable/nutriment = 5)
	w_class = WEIGHT_CLASS_NORMAL
	tastes = list("dough" = 1)
	foodtype = GRAIN
	eat_effect = /datum/status_effect/debuff/uncookedfood

/datum/crafting_recipe/roguetown/cooking/piedough
	name = "тесто для пирога"
	reqs = list(
		/datum/reagent/water = 10,
		/obj/item/reagent_containers/powder/flour= 2,
		/obj/item/reagent_containers/food/snacks/butterslice = 1,
	)
	result = /obj/item/reagent_containers/food/snacks/rogue/piedough



/datum/crafting_recipe/roguetown/cooking/berrypie
	name = "ягодный пирог"
	reqs = list(
		/obj/item/reagent_containers/food/snacks/grown/berries/rogue = 3,
		/obj/item/reagent_containers/food/snacks/rogue/piedough = 1)
	parts = list(
		/obj/item/reagent_containers/food/snacks/grown/berries/rogue = 3)
	result = /obj/item/reagent_containers/food/snacks/rogue/pie/berry


/datum/crafting_recipe/roguetown/cooking/applepie
	name = "яблочный пирог"
	reqs = list(
		/obj/item/reagent_containers/food/snacks/grown/apple = 3,
		/obj/item/reagent_containers/food/snacks/rogue/piedough = 1)
	parts = list(
		/obj/item/reagent_containers/food/snacks/grown/apple = 3)
	result = /obj/item/reagent_containers/food/snacks/rogue/pie/apple

/obj/item/reagent_containers/food/snacks/rogue/pie/berry
	name = "сырой ягодный пирог"
	desc = "Сырой ягодный пирог перед выпеканием."
	cooked_type = /obj/item/reagent_containers/food/snacks/rogue/pie/cooked/berry
	eat_effect = /datum/status_effect/debuff/uncookedfood

/obj/item/reagent_containers/food/snacks/rogue/pie/cooked/berry
	name = "ягодный пирог"
	desc = "Свежевыпеченный пирог с начинкой из сладких лесных ягод."
	list_reagents = list(/datum/reagent/consumable/nutriment = 30)
	eat_effect = /datum/status_effect/buff/foodbuff
	tastes = list("berries" = 1)

/obj/item/reagent_containers/food/snacks/rogue/pie/apple
	name = "сырой яблочный пирог"
	desc = "Сырой яблочный пирог перед выпеканием."
	cooked_type = /obj/item/reagent_containers/food/snacks/rogue/pie/cooked/apple
	eat_effect = /datum/status_effect/debuff/uncookedfood


/obj/item/reagent_containers/food/snacks/rogue/pie/cooked/apple
	name = "яблочный пирог"
	desc = "Ароматный пирог с сочными яблоками и хрустящей корочкой."
	list_reagents = list(/datum/reagent/consumable/nutriment = 30)
	eat_effect = /datum/status_effect/buff/foodbuff
	tastes = list("apples" = 1)

/datum/crafting_recipe/roguetown/cooking/meatpie
	name = "пирог с мясом"
	reqs = list(
		/obj/item/reagent_containers/food/snacks/rogue/meat/mince/beef = 3,
		/obj/item/reagent_containers/food/snacks/rogue/piedough = 1)
	parts = list(
		/obj/item/reagent_containers/food/snacks/rogue/meat/mince = 3)
	result = /obj/item/reagent_containers/food/snacks/rogue/pie/meat

	subtype_reqs = FALSE

/obj/item/reagent_containers/food/snacks/rogue/pie/meat
	name = "сырой пирог с мясом"
	desc = "Сырой пирог с мясной начинкой."
	cooked_type = /obj/item/reagent_containers/food/snacks/rogue/pie/cooked/meat
	eat_effect = /datum/status_effect/debuff/uncookedfood
	filling_color = "#8f433a"

/obj/item/reagent_containers/food/snacks/rogue/pie/cooked/meat
	name = "пирог с мясом"
	desc = "Сытный пирог с сочной мясной начинкой."
	list_reagents = list(/datum/reagent/consumable/nutriment = 30)
	eat_effect = /datum/status_effect/buff/foodbuff
	tastes = list("meat" = 1)

/datum/crafting_recipe/roguetown/cooking/meatpie/fish
	name = "рыбный пирог"
	reqs = list(
		/obj/item/reagent_containers/food/snacks/rogue/meat/mince/fish = 3,
		/obj/item/reagent_containers/food/snacks/rogue/piedough = 1
	)
	parts = list(
		/obj/item/reagent_containers/food/snacks/rogue/meat/mince/fish = 3
	)
	result = /obj/item/reagent_containers/food/snacks/rogue/pie/meat/fish


/obj/item/reagent_containers/food/snacks/rogue/pie/meat/fish
	name = "сырой рыбный пирог"
	desc = "Сырой пирог с рыбной начинкой."
	cooked_type = /obj/item/reagent_containers/food/snacks/rogue/pie/cooked/meat/fish
	tastes = list("fish" = 1)

/obj/item/reagent_containers/food/snacks/rogue/pie/cooked/meat/fish
	name = "рыбный пирог"
	desc = "Традиционный пирог с нежной рыбной начинкой."
	tastes = list("fish" = 1)

/datum/crafting_recipe/roguetown/cooking/meatpie/poultry
	name = "пирог с птицей"
	reqs = list(
		/obj/item/reagent_containers/food/snacks/rogue/meat/mince/poultry = 3,
		/obj/item/reagent_containers/food/snacks/rogue/piedough = 1
	)
	parts = list(
		/obj/item/reagent_containers/food/snacks/rogue/meat/mince/poultry = 3
	)
	result = /obj/item/reagent_containers/food/snacks/rogue/pie/meat/poultry


/obj/item/reagent_containers/food/snacks/rogue/pie/meat/poultry
	name = "сырой пирог с птицей"
	desc = "Сырой пирог с начинкой из мяса птицы."
	cooked_type = /obj/item/reagent_containers/food/snacks/rogue/pie/cooked/meat/poultry

/obj/item/reagent_containers/food/snacks/rogue/pie/cooked/meat/poultry
	name = "пирог с птицей"
	desc = "Вкусный сытный пирог с нежным мясом птицы."
	tastes = list("chicken" = 1)

/datum/crafting_recipe/roguetown/cooking/eggpie
	name = "яичный пирог"
	reqs = list(
		/obj/item/reagent_containers/food/snacks/egg = 3,
		/obj/item/reagent_containers/food/snacks/rogue/piedough = 1)
	parts = list(
		/obj/item/reagent_containers/food/snacks/egg = 3)
	result = /obj/item/reagent_containers/food/snacks/rogue/pie/egg


/obj/item/reagent_containers/food/snacks/rogue/pie/egg
	name = "сырой яичный пирог"
	desc = "Сырой пирог с яичной начинкой."
	cooked_type = /obj/item/reagent_containers/food/snacks/rogue/pie/cooked/egg
	eat_effect = /datum/status_effect/debuff/uncookedfood

/obj/item/reagent_containers/food/snacks/rogue/pie/cooked/egg
	name = "яичный пирог"
	desc = "Нежный запечённый пирог с яйцом."
	list_reagents = list(/datum/reagent/consumable/nutriment = 30)
	eat_effect = /datum/status_effect/buff/foodbuff
	tastes = list("eggs" = 1)
