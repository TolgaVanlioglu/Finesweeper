//show_debug_message(string(device_mouse_x_to_gui(0)) + " " + string(device_mouse_y_to_gui(0)))
var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);
mm_hh = 0;
f_opentilenum = instance_number(o_opentile);
f_clickable = f_opentilenum == 0;
if(f_instant == f_openanimation)
	f_instant = !(f_openanimation && f_clickable);
if(mx > 11 && mx < f_roomsizew-12 && my > 59 && my < f_roomsizeh-12)
{
	if(!f_menu)
	{
		#region board
		if(!f_gamewon && !f_gamelost && f_clickable)
		{
			mouse_mine = floor((mx-12)/36) + floor((my-60)/36)*f_roomsizex;
			
			mm_hh = 1;
			
			//multi open
			if(mouse_check_button(mb_right))
			{
				if(mouse_check_button_pressed(mb_left))
				{
					if(f_grid[mouse_mine, 0] == 1)
					{
						var mc = 0;
						var mloc = array_create(8, -1);
						if(mouse_mine >= f_roomsizex)
						{
							mloc[0] = mouse_mine-f_roomsizex;
							mc += f_grid[mouse_mine-f_roomsizex, 0] == 2;
							if(mouse_mine % f_roomsizex != 0)
							{
								mloc[1] = mloc[0]-1;
								mc += f_grid[mouse_mine-f_roomsizex-1, 0] == 2;					
							}
							if(mouse_mine % f_roomsizex != f_roomsizex-1)
							{
								mc += f_grid[mouse_mine-f_roomsizex+1, 0] == 2;
								mloc[2] = mloc[0]+1;
							}
						}
						if(mouse_mine <= f_roomsizetot-f_roomsizex)
						{
							mloc[3] = mouse_mine+f_roomsizex;
							mc += f_grid[mouse_mine+f_roomsizex, 0] == 2;
							if(mouse_mine % f_roomsizex != 0)
							{
								mloc[4] = mloc[3]-1;
								mc += f_grid[mouse_mine+f_roomsizex-1, 0] == 2;					
							}
							if(mouse_mine % f_roomsizex != f_roomsizex-1)
							{
								mloc[5] = mloc[3]+1;
								mc += f_grid[mouse_mine+f_roomsizex+1, 0] == 2;
							}
						}
						if(mouse_mine % f_roomsizex != 0)
						{
								mloc[6] = mouse_mine-1;
								mc += f_grid[mouse_mine-1, 0] == 2;					
						}
						if(mouse_mine % f_roomsizex != f_roomsizex-1)
						{
								mloc[7] = mouse_mine+1;
								mc += f_grid[mouse_mine+1, 0] == 2;
						}	
						show_debug_message("has " + string(mc) + " of " + string(f_grid[mouse_mine, 1]-1));
						
						if(mc == f_grid[mouse_mine, 1]-1)
						{
							for(var a = 0; a < 8; a++)
							{
								show_debug_message(mloc[a])
								if(mloc[a] != -1 && f_grid[mloc[a], 0] == 0)
								{
									scr_opentile(mloc[a]);
								}
							}
						}
						event_user(2);
					}
				}
			}
			//normal click
			else if(mouse_check_button_pressed(mb_left))
			{
				if(!f_gamestart)
					event_user(0);
				scr_opentile(mouse_mine);
			
				event_user(2);
			}
			//flag
			if(mouse_check_button_pressed(mb_right))
			{
				
				if(f_grid[mouse_mine, 0] == 0)
				{
					f_grid[mouse_mine, 0] = 2;
					f_gameminescur--;
				}
				else if(f_grid[mouse_mine, 0] == 2)
				{
					f_grid[mouse_mine, 0] = 3;
					f_gameminescur++;
				}
				else if(f_grid[mouse_mine, 0] == 3)
				{
					f_grid[mouse_mine, 0] = 0;
//					f_gameminescur++;
				}
				/*
				if(f_grid[mouse_mine, 0] == 0)
				{
					f_grid[mouse_mine, 0] = 2;
					f_gameminescur--;
				}
				else if(f_grid[mouse_mine, 0] == 2)
				{
					f_grid[mouse_mine, 0] = 0;
					f_gameminescur++;
				}*/
			}
			
		}
		#endregion
	}
}
else
{	
	if(my > 11 && my < 48)
	{
		//new game
		if(mx > f_bgx-39 && mx < f_bgx-3)
		{
			f_tooltip = 2;
			tooltip_text = "New Game";
			tooltip_col = c_yellow;
			tooltip_x = 80;
			tooltip_y = 0;
			if(mouse_check_button_released(mb_left) && f_clickable)
			{
				instance_destroy();
				audio_play_sound(so_button,0,0);
				var frsw = f_roomsizew;
				var frsh = f_roomsizeh; 
				var spti = f_spriteicons;
				var sptt = f_spritetiles;

				with(o_starter)
				{
					
					if(global.g_darkmode) spr_bg = s_background_dark;
					else spr_bg = s_background;
					warning = 0;
					alarm[1] = 10;
					spr_icons = spti;
					spr_tiles = sptt;
					enable = 1;
					draw_centerx = frsw/2;
					draw_centery = frsh/2;
					var yoffs = -10;
					butt_xRx = draw_centerx + 30;
					butt_xRy = draw_centery - 80 + yoffs;
					
					butt_xLx = draw_centerx - 30;
					butt_xLy = draw_centery - 80 + yoffs;
					
					butt_yRx = draw_centerx + 30;
					butt_yRy = draw_centery + yoffs;
					
					butt_yLx = draw_centerx - 30;
					butt_yLy = draw_centery + yoffs;
					
					butt_mRx = draw_centerx + 30;
					butt_mRy = draw_centery + 80 + yoffs;
					
					butt_mLx = draw_centerx - 30;
					butt_mLy = draw_centery + 80 + yoffs;
					
					butt_diffy = draw_centery-170;
					butt_diffx0 = draw_centerx - 110;
					butt_diffx1 = draw_centerx + 110;
				}
				//event_user(3);
			}
	
		}
		//restart
		else if(mx > f_bgx+2 && mx < f_bgx+38)
		{
			f_tooltip = 1;
			tooltip_text = "Restart (R)";
			tooltip_col = c_yellow;
			
			if(mouse_check_button_released(mb_left) && f_clickable)
			{
				audio_play_sound(so_button,0,0);
				event_user(1);
				f_bgframe = irandom(array_length(global.g_bgauthorlist)-1);
				f_bgauthor = "By: "+global.g_bgauthorlist[f_bgframe];
			}
		}
		//animations then sounds
		else if(mx > f_bgx+44 && mx < f_bgx+80)
		{
			if(my < 27)
			{
				f_tooltip = 1;
				if(global.g_animations) tooltip_text = "Animations (on)";
				else tooltip_text = "Animations (off)";
				tooltip_col = c_blue;
				
				if(mouse_check_button_released(mb_left))
				{
					audio_sound_pitch(so_button,1-global.g_animations*0.1);
					audio_play_sound(so_button,0,0);
					global.g_animations = !global.g_animations;
					f_openanimation = global.g_animations;
				}
			}
			else if(my > 31)
			{
				f_tooltip = 1;
				//tooltip_text = "Scale (" + string(scsize) + ")";
				tooltip_text = "Sound (";
				switch(global.g_sounds)
				{
					case 0:
						tooltip_text += "Off)";
						break;
					case 1:
						tooltip_text += "25%)";
						break;
					case 2:
						tooltip_text += "50%)";
						break;
					case 3:
						tooltip_text += "75%)";
						break;
					case 4:
						tooltip_text += "100%)";
						break;
				}
				
				tooltip_col = c_red;
				
				if(mouse_check_button_released(mb_left))
				{
					global.g_sounds = (global.g_sounds+1)%5;
					audio_play_sound(so_button,0,0);
					audio_set_master_gain(0, global.g_sounds*0.25);
					
					//global.g_sounds = !global.g_sounds;
				}
				if(mouse_check_button_released(mb_right))
				{
					global.g_sounds = scr_indexer(global.g_sounds-1, 5);
					audio_play_sound(so_button,0,0);
					audio_set_master_gain(0, global.g_sounds*0.25);
					
					//global.g_sounds = !global.g_sounds;
				}
				/*
				if(global.g_animations) tooltip_text = "Sounds (on)";
				else tooltip_text = "Sounds (off)";
				
				if(mouse_check_button_released(mb_left))
				{
					global.g_sounds = !global.g_sounds;
					audio_set_master_gain(0, !audio_get_master_gain(0));

				}*/
			}
			else
				f_tooltip = 0;
			
		}
		//theme then darkmode
		else if(mx > f_bgx-80 && mx < f_bgx-45)
		{
			if(my < 27)
			{
				f_tooltip = 1;
				tooltip_col = c_lime;
				switch(global.g_theme)
				{
					case 0:
						tooltip_text = "Theme\n(Classic)";
						break;
					case 1:
						tooltip_text = "Theme\n(Rainbow)";
						break;
					case 4:
						tooltip_text = "Theme\n(2 Colors)";
						break;
					case 2:
						tooltip_text = "Theme\n(Picture)";
						break;
					case 3:
						tooltip_text = "Theme\n(B&W Picture)";
						break;
					case 6:
						tooltip_text = "Theme\n(3D)";
						break;
					case 7:
						tooltip_text = "Theme\n(Modern)";
						break;
				}
				
				
				if(mouse_check_button_released(mb_left))
				{
					audio_play_sound(so_button,0,0);
					switch(global.g_theme)
					{
						case 0:
							f_bgframe = irandom(array_length(global.g_bgauthorlist)-1);
							f_bgauthor = "By: "+global.g_bgauthorlist[f_bgframe];
							global.g_theme = 2;
							break;
						case 2:
							global.g_theme = 3;
							break;
						case 3:
							global.g_theme = 1;
							break;
						case 1:
							global.g_theme = 4;
							break;
						case 4:
							global.g_theme = 0;
					}
					f_bgtype = global.g_theme;
					event_user(4);
				}
				if(mouse_check_button_released(mb_right))
				{
					audio_play_sound(so_button,0,0);
					switch(global.g_theme)
					{
						case 0:
							global.g_theme = 4;
							break;
						case 2:
							global.g_theme = 0;
							break;
						case 3:
							global.g_theme = 2;
							break;
						case 1:
							f_bgframe = irandom(array_length(global.g_bgauthorlist)-1);
							f_bgauthor = "By: "+global.g_bgauthorlist[f_bgframe];
							global.g_theme = 3;
							break;
						case 4:
							global.g_theme = 1;
					}
					f_bgtype = global.g_theme;
					f_changedmonly = 0;
					event_user(4);
				}
			}
			else if(my > 31)
			{
				if(mx < f_bgx-58)
				{
					f_tooltip = 1;
					if(global.g_info) tooltip_text = "Show\nInfo(on)";
					else tooltip_text = "Show\nInfo(off)";
					tooltip_col = c_aqua;
					
					if(mouse_check_button_released(mb_left))
					{
						audio_sound_pitch(so_button,1-global.g_info*0.1);
						audio_play_sound(so_button,0,0);
						global.g_info = !global.g_info;
						//f_darkmode = global.g_info;
						//event_user(4);
						
					}
				}
				else
				{
					f_tooltip = 1;
					if(global.g_darkmode) tooltip_text = "Dark\nMode (on)";
					else tooltip_text = "Dark\nMode (off)";
					tooltip_col = c_white;
				
					if(mouse_check_button_pressed(mb_left))
					{
						f_changedmonly = 1;
						audio_sound_pitch(so_button,1-global.g_darkmode*0.1);
						audio_play_sound(so_button,0,0);
						global.g_darkmode = !global.g_darkmode;
						f_darkmode = global.g_darkmode;
						event_user(4);
					}
				}
			}
			else
				f_tooltip = 0;
			
		}
		else
			f_tooltip = 0;
	}
	else
		f_tooltip = 0;
}
if(my > 50) f_tooltip = 0;
hbarnum = ceil((window_get_width() - surface_get_width(application_surface))/32);
vbarnum = ceil((window_get_height() - surface_get_height(application_surface))/32);

if(my > f_roomsizeh-50)
{
	if(mx < f_bgx)
	{
		f_showopened = 0;
		f_showauthor = 1;
	}
	else
	{
		f_showopened = 1;
		f_showauthor = 0;
	}	
}
else
{
	f_showauthor = 1;
	f_showopened = 1;
}

//f_gametime += f_gametimeinc;
if(f_gametimeinc != 0)
	f_gametime = date_second_span(f_starttime,date_current_datetime());
//show_debug_message(string(current_day)+" "+string(current_hour)+" "+string(current_minute)+" "+string(current_second))