if(f_opentilenum != 0)
{
	alarm[1] = 5;
	f_pitch += 0.05;
	audio_sound_pitch(so_opentile, f_pitch);
	audio_play_sound(so_opentile, 0, 0);
}