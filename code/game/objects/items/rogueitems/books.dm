/obj/item/book/rogue
	var/open = FALSE
	icon = 'icons/roguetown/items/books.dmi'
	icon_state = "temp"
	slot_flags = ITEM_SLOT_HIP
	var/base_icon_state
	unique = TRUE
	firefuel = 2 MINUTES
	dropshrink = 0.6
	drop_sound = 'sound/foley/dropsound/book_drop.ogg'

/obj/item/book/rogue/getonmobprop(tag)
	. = ..()
	if(tag)
		if(open)
			switch(tag)
				if("gen")
					return list("shrink" = 0.4,
	"sx" = -2,
	"sy" = -3,
	"nx" = 10,
	"ny" = -2,
	"wx" = 1,
	"wy" = -3,
	"ex" = 5,
	"ey" = -3,
	"northabove" = 0,
	"southabove" = 1,
	"eastabove" = 1,
	"westabove" = 0,
	"nturn" = 0,
	"sturn" = 0,
	"wturn" = 0,
	"eturn" = 0,
	"nflip" = 0,
	"sflip" = 0,
	"wflip" = 0,
	"eflip" = 0)
				if("onbelt")
					return list("shrink" = 0.3,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)
		else
			switch(tag)
				if("gen")
					return list("shrink" = 0.4,
	"sx" = -2,
	"sy" = -3,
	"nx" = 10,
	"ny" = -2,
	"wx" = 1,
	"wy" = -3,
	"ex" = 5,
	"ey" = -3,
	"northabove" = 0,
	"southabove" = 1,
	"eastabove" = 1,
	"westabove" = 0,
	"nturn" = 0,
	"sturn" = 0,
	"wturn" = 0,
	"eturn" = 0,
	"nflip" = 0,
	"sflip" = 0,
	"wflip" = 0,
	"eflip" = 0)
				if("onbelt")
					return list("shrink" = 0.3,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)


/obj/item/book/rogue/attack_self(mob/user)
	if(!open)
		attack_right(user)
		return
	..()
	user.update_inv_hands()

/obj/item/book/rogue/rmb_self(mob/user)
	attack_right(user)
	return

/obj/item/book/rogue/read(mob/user)
	if(!open)
		to_chat(user, "<span class='info'>Сначала открой меня.</span>")
		return FALSE
	. = ..()

/obj/item/book/rogue/attackby(obj/item/I, mob/user, params)
	return

/obj/item/book/rogue/attack_right(mob/user)
	if(!open)
		slot_flags &= ~ITEM_SLOT_HIP
		open = TRUE
		playsound(loc, 'sound/items/book_open.ogg', 100, FALSE, -1)
	else
		slot_flags |= ITEM_SLOT_HIP
		open = FALSE
		playsound(loc, 'sound/items/book_close.ogg', 100, FALSE, -1)
	curpage = 1
	update_icon()
	user.update_inv_hands()

/obj/item/book/rogue/update_icon()
	icon_state = "[base_icon_state][open]"

/obj/item/book/rogue/secret/ledger
	name = "кататома"
	desc = "Торговая книга учёта доставок и заказов."
	icon_state = "ledger0"
	base_icon_state = "ledger"
	title = "Кататома"
	dat = "Чтобы создать заказ на доставку, примените папирус ко мне."

/obj/item/book/rogue/ledger/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/paper/scroll/cargo))
		if(!open)
			to_chat(user, "<span class='info'>Сначала открой меня.</span>")
			return FALSE
		var/obj/item/paper/scroll/cargo/C = I
		if(C.orders.len > 4)
			to_chat(user, "<span class='warning'>Слишком много заказов.</span>")
			return
		var/picked_cat = input(user, "Категории", "Журнал доставок") as null|anything in sortList(SSshuttle.supply_cats)
		if(!picked_cat)
			testing("yeye")
			return
		var/list/pax = list()
		for(var/pack in SSshuttle.supply_packs)
			var/datum/supply_pack/PA = SSshuttle.supply_packs[pack]
			if(PA.group == picked_cat)
				pax += PA
		var/picked_pack = input(user, "Грузы", "Журнал доставок") as null|anything in sortList(pax)
		if(!picked_pack)
			return
		var/namer = user.name
		var/rankr = "None"
		if(ishuman(user))
			var/mob/living/carbon/human/H = user
			namer = H.get_authentification_name()
			rankr = H.get_assignment(hand_first = TRUE)
		var/datum/supply_order/SO = new (picked_pack, namer, rankr, user.ckey, "None", SSeconomy.get_dep_account(ACCOUNT_CAR))
		C.orders += SO
		C.rebuild_info()
		return
	if(istype(I, /obj/item/paper/scroll))
		if(!open)
			to_chat(user, "<span class='info'>Сначала открой меня.</span>")
			return FALSE
		var/obj/item/paper/scroll/P = I
		if(P.info)
			to_chat(user, "<span class='warning'>Здесь уже что-то написано.</span>")
			return
		var/picked_cat = input(user, "Категории", "Журнал доставок") as null|anything in sortList(SSshuttle.supply_cats)
		if(!picked_cat)
			return
		var/list/pax = list()
		for(var/pack in SSshuttle.supply_packs)
			var/datum/supply_pack/PA = SSshuttle.supply_packs[pack]
			if(PA.group == picked_cat)
				pax += PA
		var/picked_pack = input(user, "Грузы", "Журнал доставок") as null|anything in sortList(pax)
		if(!picked_pack)
			return
		var/obj/item/paper/scroll/cargo/C = new(user.loc)
		var/namer = user.name
		var/rankr = "None"
		if(ishuman(user))
			var/mob/living/carbon/human/H = user
			namer = H.get_authentification_name()
			rankr = H.get_assignment(hand_first = TRUE)
		var/datum/supply_order/SO = new (picked_pack, namer, rankr, user.ckey, "None", SSeconomy.get_dep_account(ACCOUNT_CAR))
		C.orders += SO
		C.rebuild_info()
		user.dropItemToGround(P)
		qdel(P)
		user.put_in_active_hand(C)
	..()

/obj/item/book/rogue/bibble
	name = "Священное Писание"
	desc = "Священная книга, содержащая слово Божье."
	icon_state = "bibble0"
	base_icon_state = "bibble"
	title = "Библия"
	dat = "Бог"

/obj/item/book/rogue/bibble/read(mob/user)
	if(!open)
		to_chat(user, "<span class='info'>Сначала открой меня.</span>")
		return FALSE
	if(!user.client || !user.hud_used)
		return
	if(!user.hud_used.reads)
		return
	if(!user.can_read(src))
		return
	if(in_range(user, src) || isobserver(user))
		user.changeNext_move(CLICK_CD_MELEE)
		var/m
		var/list/verses = world.file2list("strings/bibble.txt")
		m = pick(verses)
		if(m)
			user.say(m)

/obj/item/book/rogue/bibble/attack(mob/living/M, mob/user)
	if(user.mind && user.mind.assigned_role == "Priest")
		if(!user.can_read(src))
			to_chat(user, "<span class='warning'>Я не понимаю эти черные закорючки.</span>")
			return
		M.apply_status_effect(/datum/status_effect/buff/blessed)
		M.add_stress(/datum/stressevent/blessed)
		user.visible_message("<span class='notice'>[user] благословляет [M].</span>")
		playsound(user, 'sound/magic/bless.ogg', 100, FALSE)
		return

/datum/status_effect/buff/blessed
	id = "blessed"
	alert_type = /obj/screen/alert/status_effect/buff/blessed
	effectedstats = list("fortune" = 1)
	duration = 20 MINUTES

/obj/screen/alert/status_effect/buff/blessed
	name = "Благословлён"
	desc = ""
	icon_state = "buff"


/obj/item/book/rogue/law
	name = "Фолиант правосудия"
	desc = "Свод законов и уложений, обязательных для исполнения каждым гражданином."
	icon_state ="lawtome0"
	base_icon_state = "lawtome"
	bookfile = "law.json"

		//no more theif stole the books
/obj/item/book/rogue/knowledge1
	name = "Книга знаний"
	desc = "Труд, содержащий полезные знания и наставления."
	icon_state ="knowledge0"
	base_icon_state = "knowledge"
	bookfile = "knowledge.json"

/obj/item/book/rogue/secret/xylix
	name = "Книга золота"
	desc = "{<font color='red'><blink>Зловещая книга, таящая неизведанную силу.</blink></font>}"
	icon_state ="xylix0"
	base_icon_state = "xylix"
	bookfile = "xylix.json"

	/obj/item/book/rogue/xylix/attack_self(mob/user)
		if(!open)
			attack_right(user)
			return
		..()
		user.update_inv_hands()
		to_chat(user, "<span class='notice'>Вы слышите эхо смеха в своей голове.</span>")
//player made books
/obj/item/book/rogue/tales1
	name = "Разрозненные сказания былых времён"
	desc = "Автор: Аламер Дж. Вевенсворт"
	icon_state ="knowledge0"
	base_icon_state = "knowledge"
	bookfile = "tales1.json"

/obj/item/book/rogue/festus
	name = "Книга Феста"
	desc = "Неизвестный автор"
	icon_state ="knowledge0"
	base_icon_state = "knowledge"
	bookfile = "tales2.json"


/obj/item/book/rogue/tales3
	name = "Мифы и легенды Рокхилла и окрестностей. Том I"
	desc = "Арбалий Младший"
	icon_state ="knowledge0"
	base_icon_state = "knowledge"
	bookfile = "tales3.json"

/obj/item/book/rogue/bookofpriests
	name = "Священная книга Сапфирии"
	desc = "Священный религиозный трактат жрецов Сапфирии."
	icon_state ="knowledge0"
	base_icon_state = "knowledge"
	bookfile = "holyguide.json"

/obj/item/book/rogue/robber
	name = "Чтиво для разбойников"
	desc = "Автор: Флавий из Дендора"
	icon_state ="knowledge0"
	base_icon_state = "knowledge"
	bookfile = "tales4.json"

/obj/item/book/rogue/cardgame
	name = "Муки Грейстоуна: основные правила"
	desc = "Автор: Джонус из Доу"
	icon_state ="knowledge0"
	base_icon_state = "knowledge"
	bookfile = "tales5.json"

/obj/item/book/rogue/blackmountain
	name = "Забрекалрек, сага Чёрной горы: часть первая"
	desc = "Записано сказителем Горреком, переведено Харгридом Толкователем."
	icon_state ="knowledge0"
	base_icon_state = "knowledge"
	bookfile = "tales6.json"

/obj/item/book/rogue/beardling
	name = "Камень и скала — азбука и сказки для бородатиков"
	desc = "Издано Дворфийской Федерацией"
	icon_state ="knowledge0"
	base_icon_state = "knowledge"
	bookfile = "tales7.json"

/obj/item/book/rogue/abyssor
	name = "Сказание о тех, кто живёт в море"
	desc = "Автор: Беллум Эгир"
	icon_state ="knowledge0"
	base_icon_state = "knowledge"
	bookfile = "tales8.json"

/obj/item/book/rogue/necra
	name = "Погребальные обряды Некры"
	desc = "Автор: Хунлаф, могильщик. Исправлено Ленорой, жрицей Некры."
	icon_state ="knowledge0"
	base_icon_state = "knowledge"
	bookfile = "tales9.json"

/obj/item/book/rogue/noc
	name = "Ловец снов"
	desc = "Автор: Хунлаф, могильщик. Исправлено Ленорой, жрицей Некры."
	icon_state ="knowledge0"
	base_icon_state = "knowledge"
	bookfile = "tales10.json"

/obj/item/book/rogue/fishing
	name = "Руководство Фонтейна по рыболовному делу"
	desc = "Автор: Форд Фонтейн"
	icon_state ="knowledge0"
	base_icon_state = "knowledge"
	bookfile = "tales11.json"

/obj/item/book/rogue/sword
	name = "Шесть безумств: как выжить с мечом в руке"
	desc = "Автор: Теодор Кишкодёр"
	icon_state ="knowledge0"
	base_icon_state = "knowledge"
	bookfile = "tales12.json"

/obj/item/book/rogue/arcyne
	name = "Скрытая магия: откуда исходит сила Арканы?"
	desc = "Автор: Килдрен Берчвуд, учёный-маг"
	icon_state ="knowledge0"
	base_icon_state = "knowledge"
	bookfile = "tales13.json"

/obj/item/book/rogue/nitebeast
	name = "Легенда о ночной твари"
	desc = "Автор: Пакетто Учёный"
	icon_state ="knowledge0"
	base_icon_state = "knowledge"
	bookfile = "tales14.json"
