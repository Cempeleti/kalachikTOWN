/obj/structure/telescope
	name = "подзорная труба"
	desc = "Загадочная подзорная труба, направленная к звёздам."
	icon = 'icons/roguetown/misc/structure.dmi'
	icon_state = "telescope"
	density = TRUE
	anchored = FALSE

/obj/structure/telescope/attack_hand(mob/user)
	if(!ishuman(user))
		return

	var/mob/living/carbon/human/H = user
	var/random_message = pick("Видно, как вращается Нок.", "Взгляд на Астрату ослепляет вас!", "Звёзды улыбаются вам.", "Неполкс сегодня красный.", "Благословенный жёлтый раздор.", "Вы видите звезду!")
	to_chat(H, "<span class='notice'>[random_message]</span>")

	if(random_message == "Взгляд на Астрату ослепляет вас!")
		if(do_after(H, 25, target = src))
			var/obj/item/bodypart/affecting = H.get_bodypart("head")
			to_chat(H, "<span class='warning'>Ослепительный свет причиняет вам сильную боль!</span>")
			if(affecting && affecting.receive_damage(0, 5))
				H.update_damage_overlays()


/obj/structure/globe
	name = "глобус"
	desc = "Таинственный глобус, изображающий устройство этого мира."
	icon = 'icons/roguetown/misc/structure.dmi'
	icon_state = "globe"
	density = TRUE
	anchored = FALSE

/obj/structure/globe/attack_hand(mob/user)
	if(!ishuman(user))
		return

	var/mob/living/carbon/human/H = user
	var/random_message = pick("Вы вращаете глобус!", "Палец попадает на Рокхилл!", "Палец попадает на Зибантин!", "Палец попадает на порт Ледяной Куб!", "Палец попадает на порт Торнвейл!", "Палец попадает на Гренцельхофт!")
	to_chat(H, "<span class='notice'>[random_message]</span>")