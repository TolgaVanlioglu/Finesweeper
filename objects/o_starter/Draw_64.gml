if(enable)
{
	var mx = device_mouse_x_to_gui(0);
	var my = device_mouse_y_to_gui(0);
	var prop = (global.g_mines*100)/(global.g_minex*global.g_miney);
	//slider_mx = slider_centerx + 2*global.g_minex-40;
	//slider_my = slider_centerx + 2*global.g_miney-40;
	//slider_ms = slider_centerx + 2*global.g_mines-40;
		
	var vx = floor(draw_centerx/8);//draw_centerx/9;
	var vy = floor(draw_centery/8);//draw_centery/9;
	c+=2;
	if(c == 360) c = 0;
	var xoff = 5*(dcos(c)-1);
	var yoff = 5*(dsin(c)-1);
	
	var vright = draw_centerx*2-36;
	var vdown = draw_centery*2-36;
	
	//draw_set_color(make_color_rgb(137,137,137));
	//draw_rectangle(0,0,vright,vdown,0);
	//draw_set_color(c_white);
	
	draw_sprite_ext(spr_bg,8,0,0,vx,vy,0,c_white,1);
	
	for(var a = 0; a < vy; a++)
	{
		draw_sprite(spr_bg,5,0,a*36);
		draw_sprite(spr_bg,7,vright,a*36);
	}
	
	for(var a = 0; a < vx; a++)
	{
		draw_sprite(spr_bg,4,a*36,0);
		draw_sprite(spr_bg,6,a*36,vdown);
	}
	
	/*
	for(var a = 0; a < vy; a++)
	{
		for(var b = 0; b < vx; b++)
		{
			draw_sprite(s_background,8,a*36,b*36);

			if(b == 0)
				draw_sprite(s_background,4,a*36,b*36);
			else if(b == vx-1)
				draw_sprite(s_background,6,a*36,b*36);
		}
	}
	*/
	draw_sprite(spr_bg,0,0,0);
	draw_sprite(spr_bg,1,vright,0);
	draw_sprite(spr_bg,2,0,vdown);
	draw_sprite(spr_bg,3,vright,vdown);
	
	/*
	switch(bg_mode)
	{
		case 0:
			for(var b = 0; b < vy; b++)
			{
				for(var a = 0; a < vx; a++)
				{
					if((a+b)%2 == 1)
					{
						if(global.g_theme == 1 || global.g_theme == 4)
						{
							draw_sprite_ext(spr_tiles,1,a*72+xoff,b*72+yoff,2,2,0,make_color_hsv((a+b)*5,255,255),1);
							gpu_set_blendmode(bm_add);
							draw_sprite_ext(spr_icons,7,a*72+xoff,b*72+yoff,2,2,0,c_white,1);
							gpu_set_blendmode(bm_normal);
						}
						else
						{
							draw_sprite_ext(spr_tiles,1,a*72+xoff,b*72+yoff,2,2,0,c_white,1);
							draw_sprite_ext(spr_icons,7,a*72+xoff,b*72+yoff,2,2,0,c_white,1);
						}
					}
					else
					{
						draw_sprite_ext(spr_tiles,0,a*72+xoff,b*72+yoff,2,2,0,c_white,1);
						draw_sprite_ext(spr_icons,0,a*72+xoff,b*72+yoff,2,2,0,c_white,1);
					}
				}
			}
			break;
		case 1:
			for(var b = 0; b < vy; b++)
			{
				for(var a = 0; a < vx; a++)
				{
					if((a+b)%3 == 1)
					{
						if(global.g_theme == 1 || global.g_theme == 4)
						{
							draw_sprite_ext(spr_tiles,1,a*72+xoff,b*72+yoff,2,2,0,make_color_hsv((a+b)*5,255,255),1);
							gpu_set_blendmode(bm_add);
							draw_sprite_ext(spr_icons,9,a*72+xoff,b*72+yoff,2,2,0,c_white,1);
							gpu_set_blendmode(bm_normal);
						}
						else
						{
							draw_sprite_ext(spr_tiles,1,a*72+xoff,b*72+yoff,2,2,0,c_white,1);
							draw_sprite_ext(spr_icons,9,a*72+xoff,b*72+yoff,2,2,0,c_white,1);
						}
					//	draw_sprite_ext(spr_tiles,1,a*72+xoff,b*72+yoff,2,2,0,c_white,1);
					//	draw_sprite_ext(spr_icons,9,a*72+xoff,b*72+yoff,2,2,0,c_white,1);
					}
					else
					{
						draw_sprite_ext(spr_tiles,0,a*72+xoff,b*72+yoff,2,2,0,c_white,1);
						draw_sprite_ext(spr_icons,0,a*72+xoff,b*72+yoff,2,2,0,c_white,1);
					}
				}
			}
			break;
		case 2:
			for(var b = 0; b < vy; b++)
			{
				for(var a = 0; a < vx; a++)
				{
					if((a+b)%3 == 1)
					{
						draw_sprite_ext(spr_tiles,0,a*72+xoff,b*72+yoff,2,2,0,c_white,1);
						draw_sprite_ext(spr_icons,0,a*72+xoff,b*72+yoff,2,2,0,c_white,1);
					}
					else
					{
						if(global.g_theme == 1 || global.g_theme == 4)
						{
							draw_sprite_ext(spr_tiles,1,a*72+xoff,b*72+yoff,2,2,0,make_color_hsv((a+b)*5,255,255),1);
							gpu_set_blendmode(bm_add);
							draw_sprite_ext(spr_icons,6,a*72+xoff,b*72+yoff,2,2,0,c_white,1);
							gpu_set_blendmode(bm_normal);
						}
						else
						{
							draw_sprite_ext(spr_tiles,1,a*72+xoff,b*72+yoff,2,2,0,c_white,1);
							draw_sprite_ext(spr_icons,6,a*72+xoff,b*72+yoff,2,2,0,c_white,1);
						}
						//draw_sprite_ext(spr_tiles,1,a*72+xoff,b*72+yoff,2,2,0,c_white,1);
						//draw_sprite_ext(spr_icons,6,a*72+xoff,b*72+yoff,2,2,0,c_white,1);
					}
				}
			}
			break;
		case 3:
			for(var b = 0; b < vy; b++)
			{
				for(var a = 0; a < vx; a++)
				{
					if((a+b)%4 == 1)
					{
						draw_sprite_ext(spr_tiles,0,a*72+xoff,b*72+yoff,2,2,0,c_white,1);
						draw_sprite_ext(spr_icons,0,a*72+xoff,b*72+yoff,2,2,0,c_white,1);
					}
					else
					{
						if(global.g_theme == 1 || global.g_theme == 4)
						{
							draw_sprite_ext(spr_tiles,1,a*72+xoff,b*72+yoff,2,2,0,make_color_hsv((a+b)*5,255,255),1);
							gpu_set_blendmode(bm_add);
							draw_sprite_ext(spr_icons,5,a*72+xoff,b*72+yoff,2,2,0,c_white,1);
							gpu_set_blendmode(bm_normal);
						}
						else
						{
							draw_sprite_ext(spr_tiles,1,a*72+xoff,b*72+yoff,2,2,0,c_white,1);
							draw_sprite_ext(spr_icons,5,a*72+xoff,b*72+yoff,2,2,0,c_white,1);
						}
						//draw_sprite_ext(spr_tiles,1,a*72+xoff,b*72+yoff,2,2,0,c_white,1);
						//draw_sprite_ext(spr_icons,5,a*72+xoff,b*72+yoff,2,2,0,c_white,1);
					}
				}
			}
			break;
		case 4:
			for(var b = 0; b < vy; b++)
			{
				for(var a = 0; a < vx; a++)
				{
					if((a)%3 == 1)
					{
						if(global.g_theme == 1 || global.g_theme == 4)
						{
							draw_sprite_ext(spr_tiles,1,a*72+xoff,b*72+yoff,2,2,0,make_color_hsv((a+b)*5,255,255),1);
							gpu_set_blendmode(bm_add);
							draw_sprite_ext(spr_icons,6,a*72+xoff,b*72+yoff,2,2,0,c_white,1);
							gpu_set_blendmode(bm_normal);
						}
						else
						{
							draw_sprite_ext(spr_tiles,1,a*72+xoff,b*72+yoff,2,2,0,c_white,1);
							draw_sprite_ext(spr_icons,6,a*72+xoff,b*72+yoff,2,2,0,c_white,1);
						}
						//draw_sprite_ext(spr_tiles,1,a*72+xoff,b*72+yoff,2,2,0,c_white,1);
						//draw_sprite_ext(spr_icons,6,a*72+xoff,b*72+yoff,2,2,0,c_white,1);
					}
					else
					{
						draw_sprite_ext(spr_tiles,0,a*72+xoff,b*72+yoff,2,2,0,c_white,1);
						draw_sprite_ext(spr_icons,0,a*72+xoff,b*72+yoff,2,2,0,c_white,1);
					}
				}
			}
			break;
	}
	gpu_set_blendmode(bm_subtract);
	draw_set_color(c_gri);
	draw_rectangle(0,0,draw_centerx*2,draw_centery*2,0);
	gpu_set_blendmode(bm_normal);
	*/
	draw_set_color(c_white);
	
	//draw_rectangle(0,0,draw_centerx*2,draw_centery*2,0);
	
	//c++; if(c==360) c=0;
	
	/*
	switch(global.g_theme)
	{
		case 0:
			var hor = draw_centerx/18+1, ver = draw_centery/18+1;
			for(var yy = 0; yy < ver; yy++)
			{
				for(var xx = 0; xx < hor; xx++)
				{
					draw_sprite(s_tiles,1,xx*36+8*dcos(c),yy*36+8*dsin(c));
				}
			}
			break;
	}*/
	
	draw_set_color(c_white);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	
	
	draw_set_halign(fa_center);
	switch(global.g_theme)
	{
		case 1: case 4:
			draw_sprite(s_panel_newgame,2+global.g_darkmode,draw_centerx,butt_xRy);
			draw_sprite(s_panel_newgame,2+global.g_darkmode,draw_centerx,butt_yRy);
			draw_sprite(s_panel_newgame,2+global.g_darkmode,draw_centerx,butt_mRy);
			draw_sprite(s_butt_newgame,2+global.g_darkmode,draw_centerx,draw_centery+160);
			draw_sprite(s_butt_preset,2+4*(sel_diff==1)+global.g_darkmode,draw_centerx-110,butt_diffy);
			scr_draw_text_ol(butt_diffx0,butt_diffy,1,c_black,c_lime,"Easy",1);
			draw_sprite(s_butt_preset,2+4*(sel_diff==2)+global.g_darkmode,draw_centerx,draw_centery-170);
			scr_draw_text_ol(draw_centerx,butt_diffy,1,c_black,c_yellow,"Medium",1);
			draw_sprite(s_butt_preset,2+4*(sel_diff==3)+global.g_darkmode,draw_centerx+110,draw_centery-170);
			scr_draw_text_ol(butt_diffx1,butt_diffy,1,c_black,c_red,"Hard",1);
			break;
		default:
			draw_sprite(s_panel_newgame,global.g_darkmode,draw_centerx,butt_xRy);
			draw_sprite(s_panel_newgame,global.g_darkmode,draw_centerx,butt_yRy);
			draw_sprite(s_panel_newgame,global.g_darkmode,draw_centerx,butt_mRy);
			draw_sprite(s_butt_newgame,global.g_darkmode,draw_centerx,draw_centery+160);
			draw_sprite(s_butt_preset,0+4*(sel_diff==1)+global.g_darkmode,draw_centerx-110,butt_diffy);
			scr_draw_text_ol(butt_diffx0,butt_diffy,1,c_black,c_lime,"Easy",1);
			draw_sprite(s_butt_preset,0+4*(sel_diff==2)+global.g_darkmode,draw_centerx,draw_centery-170);
			scr_draw_text_ol(draw_centerx,butt_diffy,1,c_black,c_yellow,"Medium",1);
			draw_sprite(s_butt_preset,0+4*(sel_diff==3)+global.g_darkmode,draw_centerx+110,draw_centery-170);
			scr_draw_text_ol(butt_diffx1,butt_diffy,1,c_black,c_red,"Hard",1);
			break;
	}
	if(warning)
		draw_sprite(s_warning,0,draw_centerx+75,draw_centery+160);
	var arrdis = 5;
	scr_draw_text_ol(draw_centerx,butt_xRy-30,1,c_black,c_white,"Width");
	scr_draw_text_ol(draw_centerx,butt_xRy,1,c_black,c_white,global.g_minex);
	draw_sprite(s_menu_arrow,0,butt_xRx+arrdis*(buttoffs*(mouse_mode==2)),butt_xRy);
	draw_sprite(s_menu_arrow,1,butt_xLx-arrdis*(buttoffs*(mouse_mode==1)),butt_xLy);	
	draw_sprite(s_menu_arrow,2,butt_xRx+30+arrdis*(buttoffs*(mouse_mode==8)),butt_xRy);
	draw_sprite(s_menu_arrow,3,butt_xLx-30-arrdis*(buttoffs*(mouse_mode==7)),butt_xLy);

	scr_draw_text_ol(draw_centerx,butt_yRy-30,1,c_black,c_white,"Height");
	scr_draw_text_ol(draw_centerx,butt_yRy,1,c_black,c_white,global.g_miney);
	draw_sprite(s_menu_arrow,0,butt_yRx+arrdis*(buttoffs*(mouse_mode==4)),butt_yRy);
	draw_sprite(s_menu_arrow,1,butt_yLx-arrdis*(buttoffs*(mouse_mode==3)),butt_yLy);
	draw_sprite(s_menu_arrow,2,butt_yRx+30+arrdis*(buttoffs*(mouse_mode==10)),butt_yRy);
	draw_sprite(s_menu_arrow,3,butt_yLx-30-arrdis*(buttoffs*(mouse_mode==9)),butt_yLy);
	
	scr_draw_text_ol(draw_centerx,butt_mRy-30,1,c_black,c_white,"Mines");
	scr_draw_text_ol(draw_centerx,butt_mRy,1,c_black,c_white,global.g_mines);
	draw_sprite(s_menu_arrow,0,butt_mRx+arrdis*(buttoffs*(mouse_mode==6)),butt_mRy);
	draw_sprite(s_menu_arrow,1,butt_mLx-arrdis*(buttoffs*(mouse_mode==5)),butt_mLy);
	draw_sprite(s_menu_arrow,0,butt_mRx+30+arrdis*(buttoffs*(mouse_mode==12)),butt_mRy);
	draw_sprite(s_menu_arrow,1,butt_mLx-30-arrdis*(buttoffs*(mouse_mode==11)),butt_mLy);
	
	var varcol = c_white, vdif = "";
	if(prop < 13)
	{
		varcol = c_lime;
		vdif = "Easy";
//		scr_draw_text_ol(draw_centerx,draw_centery+110,1,c_black,c_lime,string(prop)+"% Mines (Easy)",1);
	}
	else if(prop < 16)
	{
		varcol = c_yellow;
		vdif = "Medium";
//		scr_draw_text_ol(draw_centerx,draw_centery+110,1,c_black,c_yellow,string(prop)+"% Mines (Medium)",1);
	}
	else if(prop < 22)
	{
		varcol = c_red;
		vdif = "Hard";
//		scr_draw_text_ol(draw_centerx,draw_centery+110,1,c_black,c_red,string(prop)+"% Mines (Hard)",1);
	}
	else if(prop < 28)
	{
		varcol = c_fuchsia;
		if((global.g_minex == 30 && global.g_miney == 20 && global.g_mines == 150))
		{
			vdif = "xd";
		//	scr_draw_text_ol(draw_centerx,draw_centery+110,1,c_black,c_fuchsia,string(prop)+"% Mines (xd)",1);
		}
		else
		{
		//	scr_draw_text_ol(draw_centerx,draw_centery+110,1,c_black,c_purple,string(prop)+"% Mines (Extreme)",1);
			vdif = "Extreme";
		}
	}
	else if(global.g_mines == global.g_minex*global.g_miney-1)
	{
		varcol = c_aqua;
		vdif = "Trivial";
//		scr_draw_text_ol(draw_centerx,draw_centery+110,1,c_black,c_aqua,string(prop)+"% Mines (Trivial)",1);		
	}
	else
	{
		varcol = c_teal;
		vdif = "Impossible?";
//		scr_draw_text_ol(draw_centerx,draw_centery+110,1,c_black,c_blue,string(prop)+"% Mines (Impossible?)",1);		
	}
	
	scr_draw_text_ol(draw_centerx,draw_centery+110,1,c_black,varcol,string(prop)+"% Mines ("+vdif+")",1);
	
	draw_sprite(s_teevy,global.g_darkmode,vright+24,vdown+24);
	
	if(!buttoffs)
	{
		if(scr_square_dist(mx,my,butt_xLx,butt_xLy,10,10))
		{
			mouse_mode = 1;
		}
		else if(scr_square_dist(mx,my,butt_xRx,butt_xRy,10,10))
		{
			mouse_mode = 2;
		}
		else if(scr_square_dist(mx,my,butt_yLx,butt_yLy,10,10))
		{
			mouse_mode = 3;
		}
		else if(scr_square_dist(mx,my,butt_yRx,butt_yRy,10,10))
		{
			mouse_mode = 4;
		}
		else if(scr_square_dist(mx,my,butt_mLx,butt_mLy,10,10))
		{
			mouse_mode = 5;
		}
		else if(scr_square_dist(mx,my,butt_mRx,butt_mRy,10,10))
		{
			mouse_mode = 6;
		}
		//faster
		else if(scr_square_dist(mx,my,butt_xLx-30,butt_xLy,10,10))
		{
			mouse_mode = 7;
		}
		else if(scr_square_dist(mx,my,butt_xRx+30,butt_xRy,10,10))
		{
			mouse_mode = 8;
		}
		else if(scr_square_dist(mx,my,butt_yLx-30,butt_yLy,10,10))
		{
			mouse_mode = 9;
		}
		else if(scr_square_dist(mx,my,butt_yRx+30,butt_yRy,10,10))
		{
			mouse_mode = 10;
		}
		else if(scr_square_dist(mx,my,butt_mLx-30,butt_mLy,10,10))
		{
			mouse_mode = 11;
		}
		else if(scr_square_dist(mx,my,butt_mRx+30,butt_mRy,10,10))
		{
			mouse_mode = 12;
		}
		else if(scr_square_dist(mx,my,butt_mRx+30,butt_mRy,10,10))
		{
			mouse_mode = 12;
		}
		//difficulties
		else if(scr_square_dist(mx,my,butt_diffx0,butt_diffy,48,16))
		{
			mouse_mode = 14;
		}
		else if(scr_square_dist(mx,my,draw_centerx,butt_diffy,48,16))
		{
			mouse_mode = 15;
		}
		else if(scr_square_dist(mx,my,butt_diffx1,butt_diffy,48,16))
		{
			mouse_mode = 16;
		}
		else if((abs(mx-draw_centerx) < 48) && (abs(my-draw_centery-160) < 24))
		{
			mouse_mode = 13;
		}
		else if(scr_square_dist(mx,my,draw_centerx+75,draw_centery+160,14,14))
		{
			mouse_mode = 17;
		}
		//none
		else
		{
			mouse_mode = 0;
		}
	}
	
	if(mouse_mode != 13)
	{
		if(mouse_mode == 17 && warning)
		{
			draw_set_halign(fa_right);
			draw_set_color(c_black);
			draw_text(mx-1,my,"Game will be scaled\ndown to fit screen!");
			draw_text(mx+1,my,"Game will be scaled\ndown to fit screen!");
			draw_text(mx,my+1,"Game will be scaled\ndown to fit screen!");
			draw_text(mx,my-1,"Game will be scaled\ndown to fit screen!");
			draw_set_color(c_red);
			draw_text(mx,my,"Game will be scaled\ndown to fit screen!");
			draw_set_color(c_white);
		}
		else
		{
			if(mouse_check_button_pressed(mb_left))
			{
				buttoffs = 1;
				alarm[0] = 5;
				switch(mouse_mode)
				{
					case 1:
						audio_sound_pitch(so_button,0.9);
						global.g_minex--;
						if(global.g_minex == 8) global.g_minex = 9;
						if(global.g_mines > global.g_minex*global.g_miney-1)
							global.g_mines = global.g_minex*global.g_miney-1;
						if(24 + 36*global.g_minex > display_get_width()-50)
							warning = 1;
						else
							warning = 0;
						sel_diff = 0;
						break;
					case 2:
						audio_sound_pitch(so_button,1);
						global.g_minex++;
						if(global.g_minex == 51) global.g_minex = 50;
						if(24 + 36*global.g_minex > display_get_width()-50)
							warning = 1;
						else
							warning = 0;
						sel_diff = 0;
						break;
					case 3:
						audio_sound_pitch(so_button,0.9);
						global.g_miney--;
						if(global.g_miney == 8) global.g_miney = 9;
						if(global.g_mines > global.g_minex*global.g_miney-1)
							global.g_mines = global.g_minex*global.g_miney-1;
						if(72 + 36*global.g_miney > display_get_height()-100)
							warning = 1;
						else
							warning = 0;
						sel_diff = 0;
						break;
					case 4:
						audio_sound_pitch(so_button,1);
						global.g_miney++;
						if(global.g_miney == 51) global.g_miney = 50;
						if(72 + 36*global.g_miney > display_get_height()-100)
							warning = 1;
						else
							warning = 0;
						sel_diff = 0;
						break;
					case 5:
						audio_sound_pitch(so_button,0.9);
						global.g_mines--;
						if(global.g_mines == 0) global.g_mines = 1;
						sel_diff = 0;
						break;
					case 6:
						audio_sound_pitch(so_button,1);
						global.g_mines++;
						if(global.g_mines == global.g_minex*global.g_miney) global.g_mines = global.g_minex*global.g_miney-1;
						sel_diff = 0;
						break;
				
					case 7:
						audio_sound_pitch(so_button,0.8);
						global.g_minex-=5;
						if(global.g_minex < 9) global.g_minex = 9;
						if(global.g_mines > global.g_minex*global.g_miney-1)
							global.g_mines = global.g_minex*global.g_miney-1;
						if(24 + 36*global.g_minex > display_get_width()-50)
							warning = 1;
						else
							warning = 0;
						sel_diff = 0;
						break;
					case 8:
						audio_sound_pitch(so_button,1.1);
						global.g_minex+=5;
						if(global.g_minex > 50) global.g_minex = 50;
						if(24 + 36*global.g_minex > display_get_width()-50)
							warning = 1;
						else
							warning = 0;
						
						sel_diff = 0;
						break;
					case 9:
						audio_sound_pitch(so_button,0.8);
						global.g_miney-=5;
						if(global.g_miney < 9) global.g_miney = 9;
						if(global.g_mines > global.g_minex*global.g_miney-1)
							global.g_mines = global.g_minex*global.g_miney-1;
						if(72 + 36*global.g_miney > display_get_height()-100)
							warning = 1;
						else
							warning = 0;
						sel_diff = 0;
						break;
					case 10:
						audio_sound_pitch(so_button,1.1);
						global.g_miney+=5;
						if(global.g_miney > 50) global.g_miney = 50;
						if(72 + 36*global.g_miney > display_get_height()-100)
							warning = 1;
						else
							warning = 0;
						sel_diff = 0;
						break;
					case 11:
						audio_sound_pitch(so_button,0.8);
						global.g_mines-=10;
						if(global.g_mines < 1) global.g_mines = 1;
						sel_diff = 0;
						break;
					case 12:
						audio_sound_pitch(so_button,1.1);
						global.g_mines+=10;
						if(global.g_mines > global.g_minex*global.g_miney-1) global.g_mines = global.g_minex*global.g_miney-1;
						sel_diff = 0;
						break;
					case 13:				
						audio_sound_pitch(so_button,1.1);
						enable = 0;
						instance_create_depth(0,0,depth,o_face);
						sel_diff = 0;
						break;
					case 14:
						audio_sound_pitch(so_button,1.1);
						global.g_minex = 9;
						global.g_miney = 9;
						global.g_mines = 10;
						sel_diff = 1;
						break;
					case 15:
						audio_sound_pitch(so_button,1);
						global.g_minex = 16;
						global.g_miney = 16;
						global.g_mines = 40;
						sel_diff = 2;
						break;
					case 16:
						audio_sound_pitch(so_button,0.9);
						global.g_minex = 30;
						global.g_miney = 16;
						global.g_mines = 99;
						sel_diff = 3;
						break;
				}
				if(mouse_mode != 0)
					audio_play_sound(so_button,0,0);
			}
		}
	}
	else
	{
		if(mouse_check_button_released(mb_left))
		{
			enable = 0;
			instance_create_depth(0,0,depth,o_face);
			//sel_diff = 0;
		}
	}
	
}

//	draw_set_valign(fa_center);
//	draw_set_halign(fa_right);
	
//	draw_set_color(c_white);
//	draw_text(slider_centerx-50,slider_centery-32,"Height:");
//	draw_sprite(s_slider,0,slider_centerx,slider_centery-32);
//	draw_sprite(s_slider,1,slider_mx,slider_centery-32);

//	draw_text(slider_centerx-50,slider_centery,"Width:");
//	draw_sprite(s_slider,0,slider_centerx,slider_centery);
//	draw_sprite(s_slider,1,slider_my,slider_centery);

//	draw_text(slider_centerx-50,slider_centery+32,"Mines:");
//	draw_sprite(s_slider,0,slider_centerx,slider_centery+32);
//	draw_sprite(s_slider,1,slider_ms,slider_centery+32);
	
//	draw_set_halign(fa_left);
//	draw_text(slider_centerx+50,slider_centery-32,ceil(global.g_minex));
//	draw_text(slider_centerx+50,slider_centery,ceil(global.g_miney));
//	draw_text(slider_centerx+50,slider_centery+32,ceil(global.g_mines));

	
//	if(mouse_check_button(mb_left))
//	{
//		if((mx > slider_centerx - 40 && mx < slider_centerx + 40) || drag != 0)
//		{
//			if(((my < slider_centery-28 && my > slider_centery-36) || drag == 1) && abs(mx-slider_centerx)<40)
//			{
//				drag = 1;
//				global.g_minex = ceil((mx - slider_centerx  + 40)/2);
//			}
//			else if(((my < slider_centery+4 && my > slider_centery-4) || drag == 2) && abs(mx-slider_centerx)<40)
//			{
//				drag = 2;
//				global.g_miney = ceil((mx - slider_centerx + 40)/2);
//			}
//			else if(((my < slider_centery+36 && my > slider_centery+28) || drag == 3) && abs(mx-slider_centerx)<40)
//			{
//				drag = 3;
//				global.g_mines = ceil((mx - slider_centerx + 40)/2);
//			}
//		}
//		/*
//		*/
//	}
//	else
//		drag = 0;
		
//	if(mouse_check_button_released(mb_left))
//	{
//		if(mouse_y > 50)
//		{
//			enable = 0;
//			instance_create_depth(0,0,depth,o_face);
			
//		}
//	}
		
//	show_debug_message(global.g_minex)
//	draw_set_color(c_white);
//}