if(f_timercol == c_white)
{
	
	f_timercol = f_timercolmain;
	f_minescol = f_minescolmain;
}
else
{
	f_timercol = c_white;
	f_minescol = c_white;
}

if(f_blink != 0)
{
	//audio_play_sound(so_opentile,0,0);
	alarm[0] = 10;
	f_blink--;
}