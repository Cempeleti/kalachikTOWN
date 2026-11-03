/datum/keybinding/living
	category = CATEGORY_HUMAN
	weight = WEIGHT_MOB


/datum/keybinding/living/swap_left
	hotkey_keys = list("Q")
	classic_keys = list("Q") // PAGEUP
	name = "swap_left"
	full_name = "Переключить на левую руку"
	description = ""

/datum/keybinding/living/swap_left/down(client/user)
	var/mob/M = user.mob
	if(!isliving(M))
		return
	if(M.atkswinging)
		M.stop_attack()
	if(M.active_hand_index == 1)
		var/obj/item/I = M.get_active_held_item()
		if(I)
			I.Click()
	else
		M.swap_hand(1)
	return TRUE

/datum/keybinding/living/swap_right
	hotkey_keys = list("E")
	classic_keys = list("E") // PAGEUP
	name = "swap_right"
	full_name = "Переключить на правую руку"
	description = ""

/datum/keybinding/living/swap_right/down(client/user)
	var/mob/M = user.mob
	if(!isliving(M))
		return
	if(M.atkswinging)
		M.stop_attack()
	if(M.active_hand_index == 2)
		var/obj/item/I = M.get_active_held_item()
		if(I)
			I.Click()
	else
		M.swap_hand(2)
	return TRUE

/datum/keybinding/living/swap_hands
	hotkey_keys = list()
	classic_keys = list()
	name = "swap_hands"
	full_name = "Сменить руку"
	description = ""

/datum/keybinding/living/swap_hands/down(client/user)
	var/mob/M = user.mob
	if(!isliving(M))
		return
	if(M.atkswinging)
		M.stop_attack()
	M.swap_hand()
	return TRUE

/datum/keybinding/living/activate_inhand
	hotkey_keys = list()
	classic_keys = list()
	name = "activate_inhand"
	full_name = "Использовать предмет в руке"
	description = "Использует предмет в активной руке."

/datum/keybinding/living/activate_inhand/down(client/user)
	var/mob/M = user.mob
	if(!isliving(M))
		return
	M.mode()
	return TRUE



/datum/keybinding/living/drop_item
	hotkey_keys = list("Z")
	name = "drop_item"
	full_name = "Бросить предмет"
	description = ""

/datum/keybinding/living/drop_item/down(client/user)
	var/mob/M = user.mob
	if(!isliving(M))
		return
	if(M.atkswinging)
		M.stop_attack()
	var/obj/item/I = M.get_active_held_item()
	if(I)
		user.mob.dropItemToGround(I, silent = FALSE)
	return TRUE

/datum/keybinding/living/sprint
	hotkey_keys = list()
	name = "sprint"
	full_name = "Спринт"
	description = "Спринт может быть опасен для здоровья, если не соблюдать осторожность."

/datum/keybinding/living/sprint/down(client/user)
	var/mob/M = user.mob
	if(!isliving(M))
		return
	if(M.m_intent == MOVE_INTENT_RUN)
		M.toggle_rogmove_intent(MOVE_INTENT_WALK)
	else
		M.toggle_rogmove_intent(MOVE_INTENT_RUN)
	return TRUE

/datum/keybinding/living/sneak
	hotkey_keys = list()
	name = "sneak"
	full_name = "Скрытность"
	description = "Перейти в режим скрытного передвижения."

/datum/keybinding/living/sneak/down(client/user)
	var/mob/M = user.mob
	if(!isliving(M))
		return
	if(M.m_intent == MOVE_INTENT_SNEAK)
		M.toggle_rogmove_intent(MOVE_INTENT_WALK)
	else
		M.toggle_rogmove_intent(MOVE_INTENT_SNEAK)
	return TRUE


/datum/keybinding/living/submit
	hotkey_keys = list("ShiftX")
	name = "yield"
	full_name = "Сдаться"
	description = "Сдаться врагу, что может спасти вам жизнь или ускорить её конец."

/datum/keybinding/living/submit/down(client/user)
	if(!isliving(user))
		return
	var/mob/living/L = user.mob
	if(L.doing)
		L.doing = 0
	L.submit()
	return TRUE


/datum/keybinding/living/resist
	hotkey_keys = list("X")
	name = "cancelresist"
	full_name = "Отмена/Сопротивление"
	description = "Прервать действие (например, зарядку атаки) или освободиться из захвата."

/datum/keybinding/living/resist/down(client/user)
	var/mob/living/L = user.mob
	if(!istype(L))
		return FALSE
	if(L.doing)
		L.doing = 0
	L.resist()
	return TRUE

/datum/keybinding/living/defendtoggle
	hotkey_keys = list("C")
	name = "defendtoggle"
	full_name = "Боевой режим"
	description = "Включить боевой режим. Позволяет уклоняться и парировать атаки."

/datum/keybinding/living/defendtoggle/down(client/user)
	var/mob/living/L = user.mob
	if(!isliving(L))
		return
	L.toggle_cmode()

/datum/keybinding/living/dodgeparry
	hotkey_keys = list("ShiftC")
	name = "dodgeparry"
	full_name = "Уклонение/Парирование"
	description = "Переключение между уклонением и парированием."

/datum/keybinding/living/dodgeparry/down(client/user)
	var/mob/living/L = user.mob
	if(!istype(L))
		return FALSE
	if(L.d_intent == INTENT_DODGE)
		L.def_intent_change(INTENT_PARRY)
	else
		L.def_intent_change(INTENT_DODGE)

/datum/keybinding/living/restd
	hotkey_keys = list("V")
	name = "standrest"
	full_name = "Встать/Лечь"
	description = "Переключение между положением стоя и лежа на полу."
	var/lastrest = 0

/datum/keybinding/living/restd/down(client/user)
	var/mob/living/L = user.mob
	if(!istype(L))
		return FALSE
	if(!lastrest || world.time > lastrest + 15)
		L.toggle_rest()
		lastrest = world.time
		return TRUE
	else
		return FALSE

/datum/keybinding/living/standu
	hotkey_keys = list()
	name = "stand"
	full_name = "Встать"
	description = "Подняться из положения лежа."
	var/lastrest = 0

/datum/keybinding/living/standu/down(client/user)
	var/mob/living/L = user.mob
	if(!istype(L))
		return FALSE
	if(!lastrest || world.time > lastrest + 15)
		L.stand_up()
		lastrest = world.time
		return TRUE
	else
		return FALSE

/datum/keybinding/living/rest
	hotkey_keys = list()
	name = "rest"
	full_name = "Лечь"
	description = "Лечь на землю или пол."
	var/lastrest = 0

/datum/keybinding/living/rest/down(client/user)
	var/mob/living/L = user.mob
	if(!istype(L))
		return FALSE
	if(!lastrest || world.time > lastrest + 15)
		L.lay_down()
		lastrest = world.time
		return TRUE
	else
		return FALSE

/datum/keybinding/living/lookup
	hotkey_keys = list("ShiftF")
	name = "lookup"
	full_name = "Посмотреть наверх"
	description = "Посмотреть вверх, если над вами открытое пространство."
	var/lastrest = 0

/datum/keybinding/living/lookup/down(client/user)
	var/mob/living/L = user.mob
	if(!lastrest || world.time > lastrest + 15)
		L.look_up()
		lastrest = world.time
		return TRUE
	else
		return FALSE