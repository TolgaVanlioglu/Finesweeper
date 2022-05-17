if(f_gameopened >= f_gameempties)
{
	alarm[0] = 1;
	f_gamewon = 1;
	audio_stop_sound(so_opentile);
	//audio_stop_sound(so_tada);
	if(!audio_is_playing(so_tada))
		audio_play_sound(so_tada,0,0);
	f_gametimeinc = 0;
	for(var a = 0; a < f_gamemines; a++)
	{
		f_grid[f_minelocs[a], 0] = 2;
	}
	f_gameminescur = 0;
}

