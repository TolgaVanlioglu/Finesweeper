// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_opentile(xy, sound)
{
	if(is_undefined(sound)) sound = 1;
	if(o_face.f_grid[xy, 0] == 0)
	{
		var inst = o_face.f_instant;
		if(sound)
		{
			o_face.f_pitch = 0.5+o_face.f_grid[xy, 1]/8;
			audio_sound_pitch(so_opentile, o_face.f_pitch)
			audio_play_sound(so_opentile, 0, 0);
		}
		show_debug_message("opentile at " + string(xy));
		if(o_face.f_grid[xy, 1] != 0) o_face.f_gameopened++;
		var xl = o_face.f_roomsizex;
		var yl = o_face.f_roomsizey;
		o_face.f_grid[xy, 0] = 1;
		if(o_face.f_grid[xy, 1] == 0)
		{
			audio_play_sound(so_mine, 0, 0);
			o_face.f_grid[xy, 1] = 10;
			/*
			for(var a = 0; a < o_face.f_gamemines; a++)
			{
				o_face.f_grid[f_minelocs[a], 0] = 1;
			}
			*/
			for(var a = 0; a < o_face.f_roomsizetot; a++)
			{
				if(o_face.f_grid[a,1] == 0)
					o_face.f_grid[a,0] = 1;
				else if(o_face.f_grid[a,0] == 2)
					o_face.f_grid[a,0] = 4;
			}
			o_face.f_gamelost = 1;
			o_face.f_gametimeinc = 0;
		}
		else if(o_face.f_grid[xy, 1] == 1)//open multiple tiles when tile is empty
		{
			if(xy >= xl)
			{
				scr_opentileobj(xy-xl, inst, 0);
				if(xy % xl != 0)
					scr_opentileobj(xy-1-xl, inst, 0);
				if(xy % xl != xl-1)
					scr_opentileobj(xy+1-xl, inst, 0);
			}
			if(floor(xy/xl) < yl-1)
			{
				scr_opentileobj(xy+xl, inst, 0);
				if(xy % xl != 0)
					scr_opentileobj(xy-1+xl, inst, 0);
				if(xy % xl != xl-1)
					scr_opentileobj(xy+1+xl, inst, 0);
			}
			if(xy % xl != 0)
				scr_opentileobj(xy-1, inst, 0);
			if(xy % xl != xl-1)
				scr_opentileobj(xy+1, inst, 0);
		}
	}
}