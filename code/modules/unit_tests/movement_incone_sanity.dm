/datum/mock_client
	var/list/hidden_images = list()

/datum/unit_test/movement_incone_sanity/Run()
	if(MIN_GLIDE_SIZE != 1)
		Fail("MIN_GLIDE_SIZE is [MIN_GLIDE_SIZE], expected 1")
	if(MAX_GLIDE_SIZE != world.icon_size)
		Fail("MAX_GLIDE_SIZE is [MAX_GLIDE_SIZE], expected [world.icon_size]")

	var/prev_fps = world.fps
	world.fps = 60
	var/calculated = DELAY_TO_GLIDE_SIZE(2)
	var/calculated_3 = DELAY_TO_GLIDE_SIZE(3)
	world.fps = prev_fps

	if(calculated >= 3.0)
		Fail("DELAY_TO_GLIDE_SIZE(2) at 60 FPS clamped prematurely: got [calculated], expected ~2.67")
	if(calculated < 2.5 || calculated > 2.8)
		Fail("DELAY_TO_GLIDE_SIZE(2) out of expected range (2.5 to 2.8): got [calculated]")

	if(calculated_3 < 1.6 || calculated_3 > 1.9)
		Fail("DELAY_TO_GLIDE_SIZE(3) out of expected range (1.6 to 1.9): got [calculated_3]")

	if(!(SSincone.flags & SS_TICKER))
		Fail("SSincone does not have SS_TICKER flag: flags = [SSincone.flags]")

	if(!(SSincone.runlevels & RUNLEVEL_LOBBY))
		Fail("SSincone does not have RUNLEVEL_LOBBY in runlevels")
	if(!(SSincone.runlevels & RUNLEVEL_GAME))
		Fail("SSincone does not have RUNLEVEL_GAME in runlevels")

	if(!SStime_track.initialized)
		Fail("SStime_track is not initialized")

	if(GLOB.glide_size_multiplier < 0.75 || GLOB.glide_size_multiplier > 1.25)
		Fail("GLOB.glide_size_multiplier ([GLOB.glide_size_multiplier]) out of expected range \[0.75, 1.25\]")

	var/mob/living/L = new(run_loc_bottom_left)
	var/datum/mock_client/MC = new
	var/image/test_img = image(loc = L)
	test_img.glide_size = 1
	MC.hidden_images += test_img
	L.client = MC

	L.set_glide_size(5)
	if(test_img.glide_size != 5)
		Fail("set_glide_size failed to update hidden_images glide_size: got [test_img.glide_size], expected 5")

	L.client = null
	qdel(test_img)
	qdel(MC)
	qdel(L)
