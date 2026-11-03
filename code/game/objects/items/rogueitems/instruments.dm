
/obj/item/rogue/instrument
	name = ""
	desc = ""
	icon = 'icons/roguetown/items/music.dmi'
	icon_state = ""
	slot_flags = ITEM_SLOT_HIP|ITEM_SLOT_BACK_R|ITEM_SLOT_BACK_L
	can_parry = TRUE
	force = 23
	throwforce = 7
	throw_range = 4
	var/datum/looping_sound/dmusloop/soundloop
	var/list/song_list = list()
	var/playing = FALSE

/obj/item/rogue/instrument/equipped(mob/living/user, slot)
	. = ..()
	if(playing && user.get_active_held_item() != src)
		playing = FALSE
		soundloop.stop()

/obj/item/rogue/instrument/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.4,"sx" = 0,"sy" = 2,"nx" = 15,"ny" = -4,"wx" = -1,"wy" = 2,"ex" = 7,"ey" = 1,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 8,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.3,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)

/obj/item/rogue/instrument/Initialize()
	soundloop = new(list(src), FALSE)
//	soundloop.start()
	. = ..()

/obj/item/rogue/instrument/dropped()
	..()
	if(soundloop)
		soundloop.stop()

/obj/item/rogue/instrument/attack_self(mob/living/user)
	var/stressevent = /datum/stressevent/music
	. = ..()
	if(.)
		return
	user.changeNext_move(CLICK_CD_MELEE)
	if(!playing)
		var/curfile = input(user, "Какую мелодию сыграть?", "KalachikTOWN", name) as null|anything in song_list
		if(!user)
			return
		if(user.mind)
			soundloop.stress2give = null
			switch(user.mind.get_skill_level(/datum/skill/misc/music))
				if(1)
					stressevent = /datum/stressevent/music
				if(2)
					stressevent = /datum/stressevent/music/two
				if(3)
					stressevent = /datum/stressevent/music/three
				if(4)
					stressevent = /datum/stressevent/music/four
				if(5)
					stressevent = /datum/stressevent/music/five
				if(6)
					stressevent = /datum/stressevent/music/six
		if(playing)
			playing = FALSE
			soundloop.stop()
			return
		if(!(src in user.held_items))
			return
		if(user.get_inactive_held_item())
			playing = FALSE
			soundloop.stop()
			return
		if(curfile)
			curfile = song_list[curfile]
			playing = TRUE
			soundloop.mid_sounds = list(curfile)
			soundloop.cursound = null
			soundloop.start()
		for(var/mob/living/carbon/human/L in viewers(7))
			L.add_stress(stressevent)
	else
		playing = FALSE
		soundloop.stop()

/obj/item/rogue/instrument/lute
	name = "лютня"
	desc = "Струнный щипковый музыкальный инструмент."
	icon_state = "lute"
	song_list = list("Мелодия 1" = 'sound/music/instruments/lute (1).ogg',
	"Мелодия 2" = 'sound/music/instruments/lute (2).ogg',
	"Мелодия 3" = 'sound/music/instruments/lute (3).ogg',
	"Мелодия 4" = 'sound/music/instruments/lute (4).ogg',
	"Мелодия 5" = 'sound/music/instruments/lute (5).ogg',
	"Мелодия 6" = 'sound/music/instruments/lute (6).ogg',
	"Мелодия 7" = 'sound/music/instruments/lute (7).ogg')

/obj/item/rogue/instrument/accord
	name = "аккордеон"
	desc = "Язычковый клавишно-пневматический музыкальный инструмент."
	icon_state = "accordion"
	song_list = list("Мелодия 1" = 'sound/music/instruments/accord (1).ogg',
	"Мелодия 2" = 'sound/music/instruments/accord (2).ogg',
	"Мелодия 3" = 'sound/music/instruments/accord (3).ogg',
	"Мелодия 4" = 'sound/music/instruments/accord (4).ogg',
	"Мелодия 5" = 'sound/music/instruments/accord (5).ogg',
	"Мелодия 6" = 'sound/music/instruments/accord (6).ogg')

/obj/item/rogue/instrument/guitar
	name = "гитара"
	desc = "Акустический струнный инструмент."
	icon_state = "guitar"
	song_list = list("Мелодия 1" = 'sound/music/instruments/guitar (1).ogg',
	"Мелодия 2" = 'sound/music/instruments/guitar (2).ogg',
	"Мелодия 3" = 'sound/music/instruments/guitar (3).ogg',
	"Мелодия 4" = 'sound/music/instruments/guitar (4).ogg',
	"Мелодия 5" = 'sound/music/instruments/guitar (5).ogg',
	"Мелодия 6" = 'sound/music/instruments/guitar (6).ogg')

/obj/item/rogue/instrument/harp
	name = "арфа"
	desc = "Изящный щипковый музыкальный инструмент со струнами."
	icon_state = "harp"
	song_list = list("Мелодия 1" = 'sound/music/instruments/harb (1).ogg',
	"Мелодия 2" = 'sound/music/instruments/harb (2).ogg',
	"Мелодия 3" = 'sound/music/instruments/harb (3).ogg')

/obj/item/rogue/instrument/flute
	name = "флейта"
	desc = "Деревянный духовой инструмент с нежным звучанием."
	icon_state = "flute"
	song_list = list("Мелодия 1" = 'sound/music/instruments/flute (1).ogg',
	"Мелодия 2" = 'sound/music/instruments/flute (2).ogg',
	"Мелодия 3" = 'sound/music/instruments/flute (3).ogg',
	"Мелодия 4" = 'sound/music/instruments/flute (4).ogg',
	"Мелодия 5" = 'sound/music/instruments/flute (5).ogg',
	"Мелодия 6" = 'sound/music/instruments/flute (6).ogg')

/obj/item/rogue/instrument/drum
	name = "барабан"
	desc = "Ударный инструмент, задающий ритм."
	icon_state = "drum"
	song_list = list("Мелодия 1" = 'sound/music/instruments/drum (1).ogg',
	"Мелодия 2" = 'sound/music/instruments/drum (2).ogg',
	"Мелодия 3" = 'sound/music/instruments/drum (3).ogg')
