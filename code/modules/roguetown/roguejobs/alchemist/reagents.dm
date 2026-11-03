/datum/reagent/medicine/healthpot
	name = "Зелье здоровья"
	description = "Постепенно исцеляет все виды повреждений."
	reagent_state = LIQUID
	color = "#ff0000"
	taste_description = "red"
	overdose_threshold = 0
	metabolization_rate = 20 * REAGENTS_METABOLISM
	alpha = 173

/datum/reagent/medicine/healthpot/on_mob_life(mob/living/carbon/M)
	if(M.bleed_rate < 0.3)
		M.blood_volume = min(M.blood_volume+2, BLOOD_VOLUME_MAXIMUM)
	M.adjustBruteLoss(-3*REM, 0)
	M.adjustFireLoss(-3*REM, 0)
	M.adjustOxyLoss(-3, 0)
	M.adjustOrganLoss(ORGAN_SLOT_BRAIN, -3*REM)
	M.adjustCloneLoss(-3*REM, 0)
	..()
	. = 1

/datum/reagent/medicine/manapot
	name = "Зелье маны"
	description = "Постепенно восстанавливает выносливость."
	reagent_state = LIQUID
	color = "#0000ff"
	taste_description = "manna"
	overdose_threshold = 0
	metabolization_rate = 20 * REAGENTS_METABOLISM
	alpha = 173

/datum/reagent/medicine/manapot/on_mob_life(mob/living/carbon/M)
	M.rogstam_add(100)
	..()
	. = 1

/datum/reagent/berrypoison
	name = "Ягодный яд"
	description = "Опасный природный яд из лесных ягод."
	reagent_state = LIQUID
	color = "#00B4FF"
	metabolization_rate = 0.1

/datum/reagent/berrypoison/on_mob_life(mob/living/carbon/M)
	M.add_nausea(9)
	M.adjustToxLoss(3, 0)
	return ..()
