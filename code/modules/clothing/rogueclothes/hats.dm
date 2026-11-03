/obj/item/clothing/head/roguetown
	name = "шляпа"
	desc = "Головной убор."
	icon = 'icons/roguetown/clothing/head.dmi'
	icon_state = "top_hat"
	item_state = "that"
	body_parts_covered = HEAD|HAIR
	slot_flags = ITEM_SLOT_HEAD|ITEM_SLOT_HIP
	dynamic_hair_suffix = "+generic"
	bloody_icon_state = "helmetblood"
	experimental_onhip = TRUE

/obj/item/clothing/head/roguetown/equipped(mob/user, slot)
	. = ..()
	user.update_fov_angles()

/obj/item/clothing/head/roguetown/dropped(mob/user)
	. = ..()
	user.update_fov_angles()

/obj/item/clothing/head/roguetown/roguehood
	name = "капюшон"
	desc = "Тканевый капюшон, прикрывающий голову и шею."
	color = CLOTHING_BROWN
	icon_state = "basichood"
	item_state = "basichood"
	icon = 'icons/roguetown/clothing/head.dmi'
	body_parts_covered = NECK
	slot_flags = ITEM_SLOT_HEAD
	dynamic_hair_suffix = ""
	edelay_type = 1
	adjustable = CAN_CADJUST
	toggle_icon_state = TRUE
	max_integrity = 100

/obj/item/clothing/head/roguetown/roguehood/shalal
	name = "куфия"
	desc = "Традиционный головной платок пустынников."
	color = null
	icon_state = "shalal"
	item_state = "shalal"
	icon = 'icons/roguetown/clothing/head.dmi'
	body_parts_covered = NECK
	slot_flags = ITEM_SLOT_HEAD
	dynamic_hair_suffix = ""
	edelay_type = 1
	adjustable = CAN_CADJUST
	toggle_icon_state = TRUE
	max_integrity = 100

/obj/item/clothing/head/roguetown/roguehood/astrata
	name = "солнечный капюшон"
	desc = "Легкий капюшон из светлой ткани, защищающий от палящего солнца."
	color = null
	icon_state = "astratahood"
	item_state = "astratahood"
	icon = 'icons/roguetown/clothing/head.dmi'
	body_parts_covered = NECK
	slot_flags = ITEM_SLOT_HEAD
	dynamic_hair_suffix = ""
	edelay_type = 1
	adjustable = CAN_CADJUST
	toggle_icon_state = TRUE
	max_integrity = 100

/obj/item/clothing/head/roguetown/necrahood
	name = "саван смерти"
	desc = "Зловещий погребальный саван, скрывающий лицо."
	color = null
	icon_state = "necrahood"
	item_state = "necrahood"
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR
	dynamic_hair_suffix = ""

/obj/item/clothing/head/roguetown/dendormask
	name = "маска из терновника"
	desc = "Жуткая маска, сплетенная из колючих ветвей."
	color = null
	icon_state = "dendormask"
	item_state = "dendormask"
	flags_inv = HIDEFACE|HIDEFACIALHAIR
	dynamic_hair_suffix = ""

/obj/item/clothing/head/roguetown/priestmask
	name = "солнечный лик"
	desc = "Освященный шлем истинно верующих. Берегитесь, воры."
	color = null
	icon_state = "priesthead"
	item_state = "priesthead"
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR
	dynamic_hair_suffix = ""

/obj/item/clothing/head/roguetown/priestmask/pickup(mob/living/user)
	if((user.job != "Priest") && (user.job != "Priestess"))
		to_chat(user, "<font color='yellow'>UNWORTHY HANDS TOUCH THE VISAGE, CEASE OR BE PUNISHED</font>")
		spawn(30)
			if(loc == user)
				user.adjust_fire_stacks(5)
				user.IgniteMob()

/obj/item/clothing/head/roguetown/roguehood/red
	color = CLOTHING_RED

/obj/item/clothing/head/roguetown/roguehood/black
	color = CLOTHING_BLACK

/obj/item/clothing/head/roguetown/roguehood/random/Initialize()
	color = pick("#544236", "#435436", "#543836", "#79763f")
	..()

/obj/item/clothing/head/roguetown/roguehood/mage/Initialize()
	color = pick("#4756d8", "#759259", "#bf6f39", "#c1b144")
	..()

/obj/item/clothing/head/roguetown/roguehood/AdjustClothes(mob/user)
	if(loc == user)
		if(adjustable == CAN_CADJUST)
			adjustable = CADJUSTED
			if(toggle_icon_state)
				icon_state = "[initial(icon_state)]_t"
			flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR
			body_parts_covered = NECK|HAIR|EARS|HEAD
			if(ishuman(user))
				var/mob/living/carbon/H = user
				H.update_inv_head()
			block2add = FOV_BEHIND
		else if(adjustable == CADJUSTED)
			ResetAdjust(user)
			flags_inv = null
			if(user)
				if(ishuman(user))
					var/mob/living/carbon/H = user
					H.update_inv_head()
		user.update_fov_angles()


/obj/item/clothing/head/roguetown/menacing
	name = "мешок-капюшон"
	desc = "Грубый холщовый мешок с прорезями для глаз."
	icon_state = "menacing"
	item_state = "menacing"
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR
	dynamic_hair_suffix = ""
	//dropshrink = 0.75

/obj/item/clothing/head/roguetown/menacing/bandit
	icon_state = "bandithood"

/obj/item/clothing/head/roguetown/jester
	name = "шутовской колпак"
	desc = "Яркий колпак с бубенчиками."
	icon_state = "jester"
	item_state = "jester"
	dynamic_hair_suffix = "+generic"

/obj/item/clothing/head/roguetown/strawhat
	name = "соломенная шляпа"
	desc = "Простая шляпа, сплетенная из сухой соломы."
	icon_state = "strawhat"

/obj/item/clothing/head/roguetown/puritan
	name = "шляпа с пряжкой"
	desc = "Строгая шляпа с металлической пряжкой."
	icon_state = "puritan_hat"

/obj/item/clothing/head/roguetown/nightman
	name = "цилиндр"
	desc = "Высокая строгая шляпа из темного шелка."
	icon_state = "tophat"
	color = CLOTHING_BLACK

/obj/item/clothing/head/roguetown/bardhat
	name = "шляпа с пером"
	desc = "Щегольская шляпа с ярким пером."
	icon_state = "bardhat"

/obj/item/clothing/head/roguetown/hatfur
	name = "меховая шапка"
	desc = "Теплая шапка из плотного меха."
	icon_state = "hatfur"

/obj/item/clothing/head/roguetown/hatblu
	name = "синяя меховая шапка"
	desc = "Теплая шапка из синего сукна и меха."
	icon_state = "hatblu"

/obj/item/clothing/head/roguetown/fisherhat
	name = "рыбацкая шляпа"
	desc = "Широкополая шляпа из соломы для защиты от солнца на воде."
	icon_state = "fisherhat"
	item_state = "fisherhat"
//	color = "#fbc588"
	//dropshrink = 0.75

/obj/item/clothing/head/roguetown/flathat
	name = "берет"
	desc = "Плоская шерстяная шапочка."
	icon_state = "flathat"
	item_state = "flathat"


/obj/item/clothing/head/roguetown/chaperon
	name = "шаперон"
	desc = "Модный средневековый головной убор с драпировкой."
	icon_state = "chaperon"
	item_state = "chaperon"
	flags_inv = HIDEEARS
	//dropshrink = 0.75

/obj/item/clothing/head/roguetown/cookhat
	name = "поварской колпак"
	desc = "Традиционный белый колпак повара."
	icon_state = "chef"
	item_state = "chef"
	flags_inv = HIDEEARS

/obj/item/clothing/head/roguetown/chaperon/greyscale
	name = "шаперон"
	desc = "Модный средневековый головной убор с драпировкой."
	icon_state = "chap_alt"
	item_state = "chap_alt"
	flags_inv = HIDEEARS
	color = "#cf99e3"

/obj/item/clothing/head/roguetown/chef
	name = "колпак шеф-повара"
	desc = "Высокий накрахмаленный колпак шеф-повара."
	icon_state = "chef"
	//dropshrink = 0.75

/obj/item/clothing/head/roguetown/armingcap
	name = "подшлемник"
	desc = "Мягкий матерчатый чепец, надеваемый под шлем."
	icon_state = "armingcap"
	item_state = "armingcap"
	flags_inv = HIDEEARS
	//dropshrink = 0.75

/obj/item/clothing/head/roguetown/knitcap
	name = "вязаная шапка"
	desc = "Простая шерстяная вязаная шапка."
	icon_state = "knitcap"
	//dropshrink = 0.75

/obj/item/clothing/head/roguetown/armingcap/dwarf
	color = "#cb3434"

/obj/item/clothing/head/roguetown/headband
	name = "повязка на голову"
	desc = "Тканевая повязка для удержания волос."
	icon_state = "headband"
	item_state = "headband"
	//dropshrink = 0.75
	dynamic_hair_suffix = null


/obj/item/clothing/head/roguetown/crown/serpcrown
	name = "корона Рокхилла"
	desc = "Древняя корона владык Рокхилла."
	icon_state = "serpcrown"
	//dropshrink = 0
	dynamic_hair_suffix = null
	sellprice = 200
	resistance_flags = FIRE_PROOF | ACID_PROOF

/obj/item/clothing/head/roguetown/crown/serpcrown/Initialize()
	. = ..()
	SSroguemachine.crown = src

/obj/item/clothing/head/roguetown/crown/serpcrown/surplus
	name = "корона"
	desc = "Металлическая корона с резными зубцами."
	icon_state = "serpcrowno"
	sellprice = 100

/obj/item/clothing/head/roguetown/crown/sparrowcrown
	name = "венец чемпиона"
	desc = "Изящный венец, венчающий победителя состязаний."
	icon_state = "sparrowcrown"
	//dropshrink = 0
	dynamic_hair_suffix = null
	resistance_flags = FIRE_PROOF | ACID_PROOF
	sellprice = 50

/obj/item/clothing/head/roguetown/priesthat
	name = "тиара жреца"
	desc = "Высокий жреческий головной убор."
	icon_state = "priest"
	//dropshrink = 0
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/64x64/head.dmi'
	dynamic_hair_suffix = "+generic"
	sellprice = 77
	worn_x_dimension = 64
	worn_y_dimension = 64

/obj/item/clothing/head/roguetown/reqhat
	name = "змеиная корона"
	desc = "Венец, украшенный извивающимися змеиными мотивами."
	icon_state = "reqhat"
	flags_inv = HIDEEARS
	sellprice = 100

/obj/item/clothing/head/roguetown/headdress
	name = "чужеземный убор"
	desc = "Экзотический головной убор заморских мастеров."
	icon_state = "headdress"
	sellprice = 10

/obj/item/clothing/head/roguetown/headdress/alt
	icon_state = "headdressalt"

/obj/item/clothing/head/roguetown/headband
	name = "повязка на голову"
	desc = "Красная тканевая повязка на голову."
	icon_state = "cloth"
	color = CLOTHING_RED
	sellprice = 5

/obj/item/clothing/head/roguetown/nun
	name = "апостольник"
	desc = "Монашеский головной платок, закрывающий шею и плечи."
	icon_state = "nun"
	sellprice = 5

/obj/item/clothing/head/roguetown/hennin
	name = "эннен"
	desc = "Высокий конусообразный женский головной убор знати."
	icon_state = "hennin"
	sellprice = 19
	dynamic_hair_suffix = "+generic"

/obj/item/clothing/head/roguetown/helmet
	icon = 'icons/roguetown/clothing/head.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/head.dmi'
	slot_flags = ITEM_SLOT_HEAD|ITEM_SLOT_HIP
	name = "норманнский шлем"
	desc = "Конический стальной шлем с наносником."
	body_parts_covered = HEAD|HAIR|NOSE
	icon_state = "nasal"
	sleevetype = null
	sleeved = null
	armor = list("melee" = 100, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_BLUNT)
	dynamic_hair_suffix = "+generic"
	bloody_icon_state = "helmetblood"
	anvilrepair = /datum/skill/craft/armorsmithing
	blocksound = PLATEHIT
	max_integrity = 200


/obj/item/clothing/head/roguetown/helmet/skullcap
	name = "цервельер"
	desc = "Простой полусферический стальной шлем."
	icon_state = "skullcap"
	body_parts_covered = HEAD|HAIR
	max_integrity = 200

/obj/item/clothing/head/roguetown/helmet/horned
	name = "рогатый шлем"
	desc = "Шлем, увенчанный массивными рогами."
	icon_state = "hornedcap"
	max_integrity = 200
	body_parts_covered = HEAD|HAIR

/obj/item/clothing/head/roguetown/helmet/winged
	name = "крылатый шлем"
	desc = "Шлем с декоративными металлическими крыльями."
	icon_state = "wingedcap"
	max_integrity = 200
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/64x64/head.dmi'
	worn_x_dimension = 64
	worn_y_dimension = 64
	body_parts_covered = HEAD|HAIR

/obj/item/clothing/head/roguetown/helmet/kettle
	name = "шапель"
	desc = "Стальной шлем-шапель с широкими полями, защищающий голову и уши."
	icon_state = "kettle"
	body_parts_covered = HEAD|HAIR|EARS
	armor = list("melee" = 100, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	flags_inv = HIDEEARS

/obj/item/clothing/head/roguetown/helmet/sallet
	name = "салад"
	icon_state = "sallet"
	desc = "Стальной шлем с удлиненным назатыльником, защищающий голову и уши."
	smeltresult = /obj/item/ingot/steel
	body_parts_covered = HEAD|HAIR|EARS
	flags_inv = HIDEEARS

/obj/item/clothing/head/roguetown/helmet/sallet/visored
	name = "салад с забралом"
	desc = "Стальной шлем с забралом, защищающий уши, нос и глаза."
	icon_state = "sallet_visor"
	adjustable = CAN_CADJUST
	flags_inv = HIDEEARS|HIDEFACE
	flags_cover = HEADCOVERSEYES
	body_parts_covered = HEAD|EARS|HAIR|NOSE|EYES
	block2add = FOV_BEHIND

/obj/item/clothing/head/roguetown/helmet/sallet/visored/AdjustClothes(mob/user)
	if(loc == user)
		playsound(user, "sound/items/visor.ogg", 100, TRUE, -1)
		if(adjustable == CAN_CADJUST)
			adjustable = CADJUSTED
			icon_state = "[initial(icon_state)]_raised"
			body_parts_covered = HEAD|EARS|HAIR
			flags_inv = HIDEEARS
			flags_cover = null
			if(ishuman(user))
				var/mob/living/carbon/H = user
				H.update_inv_head()
			block2add = null
		else if(adjustable == CADJUSTED)
			ResetAdjust(user)
			if(user)
				if(ishuman(user))
					var/mob/living/carbon/H = user
					H.update_inv_head()
		user.update_fov_angles()

/obj/item/clothing/head/roguetown/helmet/heavy
	name = "барбют"
	desc = "Тяжелый пехотный шлем с Т-образным вырезом для лица."
	body_parts_covered = FULL_HEAD
	icon_state = "barbute"
	item_state = "barbute"
	flags_inv = HIDEEARS|HIDEFACE
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	armor = list("melee" = 100, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_BLUNT)
	anvilrepair = /datum/skill/craft/armorsmithing
	block2add = FOV_RIGHT|FOV_LEFT
	smeltresult = /obj/item/ingot/steel

/obj/item/clothing/head/roguetown/helmet/heavy/guard
	name = "савояр"
	desc = "Тяжелый шлем стражника с глухим забралом."
	icon_state = "guardhelm"
	emote_environment = 3
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR
	block2add = FOV_RIGHT|FOV_LEFT
	smeltresult = /obj/item/ingot/iron

/obj/item/clothing/head/roguetown/helmet/heavy/sheriff
	name = "решетчатый шлем"
	desc = "Тяжелый шлем с решетчатым забралом."
	icon_state = "gatehelm"
	emote_environment = 3
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR
	block2add = FOV_RIGHT|FOV_LEFT
	smeltresult = /obj/item/ingot/iron

/obj/item/clothing/head/roguetown/helmet/heavy/knight
	name = "рыцарский шлем"
	desc = "Турнирный шлем с подвижным забралом."
	icon_state = "knight"
	item_state = "knight"
	adjustable = CAN_CADJUST
	emote_environment = 3
	block2add = FOV_RIGHT|FOV_LEFT
	smeltresult = /obj/item/ingot/steel

/obj/item/clothing/head/roguetown/helmet/heavy/knight/black
	color = CLOTHING_BLACK

/obj/item/clothing/head/roguetown/helmet/heavy/knight/AdjustClothes(mob/user)
	if(loc == user)
		playsound(user, "sound/items/visor.ogg", 100, TRUE, -1)
		if(adjustable == CAN_CADJUST)
			adjustable = CADJUSTED
			icon_state = "knightum"
			body_parts_covered = HEAD|HAIR|EARS
			flags_inv = HIDEEARS
			flags_cover = null
			emote_environment = 0
			if(ishuman(user))
				var/mob/living/carbon/H = user
				H.update_inv_head()
			block2add = null
		else if(adjustable == CADJUSTED)
			ResetAdjust(user)
			emote_environment = 3
			if(user)
				if(ishuman(user))
					var/mob/living/carbon/H = user
					H.update_inv_head()
		user.update_fov_angles()

/obj/item/clothing/head/roguetown/helmet/heavy/bucket
	name = "топфхелм"
	desc = "Глухой горшковый шлем, закрывающий всю голову."
	icon_state = "topfhelm"
	item_state = "topfhelm"
	emote_environment = 3
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR
	block2add = FOV_RIGHT|FOV_LEFT
	smeltresult = /obj/item/ingot/steel

/obj/item/clothing/head/roguetown/helmet/heavy/pigface
	name = "хундсгугель"
	desc = "Бацинет с вытянутым коническим забралом."
	icon_state = "hounskull"
	item_state = "hounskull"
	emote_environment = 3
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR
	block2add = FOV_RIGHT|FOV_LEFT
	smeltresult = /obj/item/ingot/steel

/obj/item/clothing/head/roguetown/helmet/leather
	slot_flags = ITEM_SLOT_HEAD|ITEM_SLOT_HIP
	name = "кожаный шлем"
	desc = "Шлем из жесткой дубленой кожи."
	body_parts_covered = HEAD|HAIR|EARS|NOSE
	icon_state = "leatherhelm"
	armor = list("melee" = 27, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_BLUNT)
	anvilrepair = null
	sewrepair = TRUE
	blocksound = SOFTHIT

/obj/item/clothing/head/roguetown/wizhat
	name = "шляпа волшебника"
	desc = "Помогает отличить опасных чародеев от выживших из ума стариков."
	icon_state = "wizardhat"
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/64x64/head.dmi'
	dynamic_hair_suffix = "+generic"
	sellprice = 100
	worn_x_dimension = 64
	worn_y_dimension = 64

/obj/item/clothing/head/roguetown/wizhat/gen
	icon_state = "wizardhatgen"

/obj/item/clothing/head/roguetown/nyle
	name = "око Найла"
	desc = "Драгоценный камень в золотой оправе на лоб."
	icon_state = "nile"
	body_parts_covered = null
	slot_flags = ITEM_SLOT_HEAD
	dynamic_hair_suffix = null
	sellprice = 100
	resistance_flags = FIRE_PROOF
