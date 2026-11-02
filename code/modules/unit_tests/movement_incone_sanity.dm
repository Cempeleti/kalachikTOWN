/datum/unit_test/movement_incone_sanity/Run()
	if(MIN_GLIDE_SIZE != 1)
		Fail("MIN_GLIDE_SIZE is [MIN_GLIDE_SIZE], expected 1")
	if(MAX_GLIDE_SIZE != world.icon_size)
		Fail("MAX_GLIDE_SIZE is [MAX_GLIDE_SIZE], expected [world.icon_size]")

	var/prev_fps = world.fps
	world.fps = 60
	var/calculated = DELAY_TO_GLIDE_SIZE(2)
	world.fps = prev_fps

	if(calculated >= 3.0)
		Fail("DELAY_TO_GLIDE_SIZE(2) at 60 FPS clamped prematurely: got [calculated], expected ~2.67")
	if(calculated < 2.5 || calculated > 2.8)
		Fail("DELAY_TO_GLIDE_SIZE(2) out of expected range (2.5 to 2.8): got [calculated]")

	if(!(SSincone.flags & SS_TICKER))
		Fail("SSincone does not have SS_TICKER flag: flags = [SSincone.flags]")
