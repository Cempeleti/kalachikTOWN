/datum/anvil_recipe/tools/torch
	name = "железные факелы (+уголь)"
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/rogueore/coal)
	created_item = list(/obj/item/flashlight/flare/torch/metal,
						/obj/item/flashlight/flare/torch/metal,
						/obj/item/flashlight/flare/torch/metal,
						/obj/item/flashlight/flare/torch/metal,
						/obj/item/flashlight/flare/torch/metal)

/datum/anvil_recipe/tools/pan
	name = "сковорода"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/cooking/pan

/datum/anvil_recipe/tools/keyring
	name = "связки ключей"
	req_bar = /obj/item/ingot/iron
	created_item = list(/obj/item/keyring,
						/obj/item/keyring,
						/obj/item/keyring)

/datum/anvil_recipe/tools/needle
	name = "швейные иглы"
	req_bar = /obj/item/ingot/iron
	created_item = list(/obj/item/needle,
						/obj/item/needle,
						/obj/item/needle,
						/obj/item/needle,
						/obj/item/needle)

/datum/anvil_recipe/tools/shovel
	name = "лопата (+2 палки)"
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/grown/log/tree/stick,/obj/item/grown/log/tree/stick)
	created_item = /obj/item/rogueweapon/shovel

/datum/anvil_recipe/tools/hammer
	name = "кузнечный молот (+палка)"
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/grown/log/tree/stick)
	created_item = /obj/item/rogueweapon/hammer

/datum/anvil_recipe/tools/tongs
	name = "кузнечные клещи"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/rogueweapon/tongs

/datum/anvil_recipe/tools/sickle
	name = "серп (+палка)"
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/grown/log/tree/stick)
	created_item = /obj/item/rogueweapon/sickle

/datum/anvil_recipe/tools/pick
	name = "кирка (+палка)"
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/grown/log/tree/stick)
	created_item = /obj/item/rogueweapon/pick

/datum/anvil_recipe/tools/hoe
	name = "мотыга (+2 палки)"
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/grown/log/tree/stick,/obj/item/grown/log/tree/stick)
	created_item = /obj/item/rogueweapon/hoe

/datum/anvil_recipe/tools/pitchfork
	name = "вилы (+2 палки)"
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/grown/log/tree/stick,/obj/item/grown/log/tree/stick)
	created_item = /obj/item/rogueweapon/pitchfork

/datum/anvil_recipe/tools/lamptern
	name = "фонарь"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/flashlight/flare/torch/lantern

/datum/anvil_recipe/tools/cups
	name = "железные кружки"
	req_bar = /obj/item/ingot/iron
	created_item = list(/obj/item/reagent_containers/glass/cup,
						/obj/item/reagent_containers/glass/cup,
						/obj/item/reagent_containers/glass/cup)

/datum/anvil_recipe/tools/cupssteel
	name = "стальные кубки"
	req_bar = /obj/item/ingot/steel
	created_item = list(/obj/item/reagent_containers/glass/cup/steel,
						/obj/item/reagent_containers/glass/cup/steel,
						/obj/item/reagent_containers/glass/cup/steel)

/datum/anvil_recipe/tools/cupssil
	name = "серебряные кубки"
	req_bar = /obj/item/ingot/silver
	created_item = list(/obj/item/reagent_containers/glass/cup/silver,
						/obj/item/reagent_containers/glass/cup/silver,
						/obj/item/reagent_containers/glass/cup/silver)

/datum/anvil_recipe/tools/cupsgold
	name = "золотые кубки"
	req_bar = /obj/item/ingot/gold
	created_item = list(/obj/item/reagent_containers/glass/cup/golden,
						/obj/item/reagent_containers/glass/cup/golden,
						/obj/item/reagent_containers/glass/cup/golden)

/datum/anvil_recipe/tools/cogstee
	name = "стальная шестерня"
	req_bar = /obj/item/ingot/steel
	created_item = list(/obj/item/roguegear,
						/obj/item/roguegear,
						/obj/item/roguegear)

/datum/anvil_recipe/tools/cogiron
	name = "железная шестерня"
	req_bar = /obj/item/ingot/iron
	created_item = list(/obj/item/roguegear,
						/obj/item/roguegear,
						/obj/item/roguegear)
