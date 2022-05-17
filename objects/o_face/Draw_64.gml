surface_resize(application_surface, f_roomsizew, f_roomsizeh);
//shader_set(choose(sh_R,sh_G,sh_B));
var vsmileo = mouse_check_button(mb_left);
var vsec = f_gametime*f_gamestart//60;

if(f_bgtype == 2)
{
	draw_sprite_ext(s_bg, f_bgframe, f_bgx, f_bgy, bgscale, bgscale, 0, c_white, 1);
}
else if(f_bgtype == 3)
{
	shader_set(sh_baw);
	draw_sprite_ext(s_bg, f_bgframe, f_bgx, f_bgy, bgscale, bgscale, 0, c_white, 1);
	shader_reset();
}
else
{
	
	
		
	if(f_bgtype == 1)
	{
		if(!f_gamewon)
		{
			f_bgc+=0.5;
			f_timercol = make_color_hsv((f_bgc+f_rainbowoffs)%256,255,255);
			f_minescol = make_color_hsv(f_bgc,255,255);
			f_timercolmain = f_timercol;
			f_minescolmain = f_minescol;
		}
	}
	else if(f_bgtype == 4)
	{
		f_bgc+=1
	}
	if(f_bgc > 255)
		f_bgc -= 255;
}
#region frame
draw_sprite(f_spriteframe, 0, 0, 0);
draw_sprite(f_spriteframe, 2, f_draw_right, 0);
draw_sprite(f_spriteframe, 5, 0, f_draw_bottom);
draw_sprite(f_spriteframe, 7, f_draw_right, f_draw_bottom);


for(var a = 0; a < f_roomsizex-2; a++)
{
	draw_sprite(f_spriteframe, 1, 48 + a*36, 0);
	draw_sprite(f_spriteframe, 6, 48 + a*36, f_draw_bottom);
}

for(var b = 0; b < f_roomsizey-2; b++)
{
	draw_sprite(f_spriteframe, 3, 0, 96 + b*36);
	draw_sprite(f_spriteframe, 4, f_draw_right, 96 + b*36);
}
#endregion

#region buttons

//restart
draw_sprite(f_spritebutttiles, 0, f_bgx + 3, 12);
if(f_gamewon)
	vsmileo = 2;
else if(f_gamelost)
	vsmileo = 3;
draw_sprite(s_buttons, vsmileo+1, f_bgx + 3, 12);

//new game
draw_sprite(f_spritebutttiles, 0, f_bgx - 39, 12);
draw_sprite(s_buttons, 0, f_bgx - 39, 12);

//animations
draw_sprite(f_spritebutttiles, 2 + global.g_animations, f_bgx + 45, 12);
draw_sprite(s_buttons, 7 + !global.g_animations, f_bgx + 45, 12);

//sounds
draw_sprite(f_spritebutttiles, 2 + (global.g_sounds!=0), f_bgx + 45, 32);
draw_sprite(s_buttons, 5 + !global.g_sounds, f_bgx + 45, 32);

//theme
draw_sprite(f_spritebutttiles, 2, f_bgx - 81, 12);
draw_sprite(s_buttons, 11 + global.g_theme, f_bgx - 81, 12);

//darkmode
//draw_sprite(f_spritebutttiles, 2 + global.g_darkmode, f_bgx - 81, 32);
//draw_sprite(s_buttons, 9, f_bgx - 81, 32);

draw_sprite(f_spritebutttiles, 4 + global.g_darkmode, f_bgx - 61, 32);
draw_sprite(s_buttons, 9, f_bgx - 61, 32);

//info
draw_sprite(f_spritebutttiles, 4 + global.g_info, f_bgx - 81, 32);
draw_sprite(s_buttons, 10, f_bgx - 81, 32);

//mines
draw_sprite_ext(f_spritebutttiles, 1, 12, 12, 1, 1, 0, f_minescol, 1);
if(f_gameminescur > 9)
{
	draw_sprite_ext(f_spritedigits, floor(f_gameminescur/10), 30, 12, 1, 1, 0, f_minescol, 1);
	if(f_gameminescur > 99)
		draw_sprite_ext(f_spritedigits, floor(f_gameminescur/100), 12, 12, 1, 1, 0, f_minescol, 1);
}
draw_sprite_ext(f_spritedigits, f_gameminescur%10, 48, 12, 1, 1, 0, f_minescol, 1);

draw_sprite_ext(f_spritebutttiles, 1, f_roomsizew - 66, 12, 1, 1, 0, f_timercol, 1);
//fix time here.
//vsec = date_compare_date()() //(60*current_minute+current_second-f_starttime)*f_gametimeinc;
if(vsec > 10)
{
	draw_sprite_ext(f_spritedigits, floor(vsec/10), f_roomsizew - 48, 12, 1, 1, 0, f_timercol, 1);
	if(vsec > 100)
		draw_sprite_ext(f_spritedigits, floor(vsec/100), f_roomsizew - 66, 12, 1, 1, 0, f_timercol, 1);
}
draw_sprite_ext(f_spritedigits, vsec%10, f_roomsizew - 30, 12, 1, 1, 0, f_timercol, 1);

#endregion

if(!f_menu)
{
	#region board
	for(var a = 0; a < f_roomsizex; a++)
	{
		for(var b = 0; b < f_roomsizey; b++)
		{
			var dx = 12 + a*36;
			var dy = 60 + b*36;
			if(f_grid[a + b*f_roomsizex, 0] == 0) //closed
			{
				//if(f_bgtype != 3)
				draw_sprite_ext(f_spritetiles, 0, dx, dy, 1, 1, 0, c_white, 1);
				
				if(mouse_mine == a + b*f_roomsizex)
				{
					gpu_set_blendmode(bm_add);
					draw_sprite(s_highlight, 0, dx, dy);
					gpu_set_blendmode(bm_normal);
				}
			}
			else if(f_grid[a + b*f_roomsizex, 0] == 1) //opened
			{
				switch(f_bgtype)
				{
					case 0: case 6://def
						draw_sprite_ext(f_spritetiles, 1, dx, dy, 1, 1, 0, c_white, 1);
						draw_sprite_ext(f_spriteicons, f_grid[a+b*f_roomsizex, 1]+2, dx, dy, 1, 1, 0, c_white, 1);
						break;
					case 1://rainbow
						draw_sprite_ext(f_spritetiles, 1, dx, dy, 1, 1, 0, make_color_hsv((a*3+b*3+f_bgc)%255,255,255), 1);
						gpu_set_blendmode(bm_add);
					
						if(f_grid[a+b*f_roomsizex,1]==0||f_grid[a+b*f_roomsizex,1]==10)
						{
							gpu_set_blendmode(bm_subtract);
						}

						//CHANGE THIS OMG remove the 10- ok we gud
						draw_sprite_ext(f_spriteicons, f_grid[a+b*f_roomsizex, 1]+2, dx, dy, 1, 1, 0, c_white, 1);
						break;
					case 4://rainbow 2
						var cof = abs(((a*10+b*10+f_bgc)%255)-127)*2;
						f_cols[f_col2] = cof;
						draw_sprite_ext(f_spritetiles, 1, dx, dy, 1, 1, 0, make_color_rgb(f_cols[0],f_cols[1],f_cols[2]), 1);
						gpu_set_blendmode(bm_add);

						if(f_grid[a+b*f_roomsizex,1]==0||f_grid[a+b*f_roomsizex,1]==10)
							gpu_set_blendmode(bm_subtract);

						draw_sprite_ext(f_spriteicons, f_grid[a+b*f_roomsizex, 1]+2, dx, dy, 1, 1, 0, c_white, 1);
						/*
						var cof = abs(((a*10+b*10+f_bgc)%255)-127)*2;
						draw_sprite_ext(f_spritetiles, 1, dx, dy, 1, 1, 0, scr_colmode(f_rmode,f_gmode,f_bmode,cof), 1);
						gpu_set_blendmode(bm_add);

						if(f_grid[a+b*f_roomsizex,1]==0||f_grid[a+b*f_roomsizex,1]==10)
							gpu_set_blendmode(bm_subtract);

						draw_sprite_ext(f_spriteicons, f_grid[a+b*f_roomsizex, 1]+2, dx, dy, 1, 1, 0, c_white, 1);
						*/
						break;
					case 5://rainbow 3
						var cof = irandom(255)//point_distance(dx, dy, device_mouse_x_to_gui(0), device_mouse_y_to_gui(0))%255;
						draw_sprite_ext(f_spritetiles, 1, dx, dy, 1, 1, 0, make_color_hsv(cof,255,255), 1);
						gpu_set_blendmode(bm_add);
						draw_sprite_ext(f_spriteicons, f_grid[a+b*f_roomsizex, 1]+2, dx, dy, 1, 1, 0, c_white, 1);
						break;
					//case 2://bg with tile
					//	draw_sprite_ext(f_spriteicons, f_grid[a+b*f_roomsizex, 1]+2, dx, dy, 1, 1, 0, c_white, 1);
					//	break;
					case 2: case 3://bg NO it is 2 color def
						draw_sprite_ext(f_spritetiles, 1, dx, dy, 1, 1, 0, c_white, 0.2);
						draw_sprite_ext(f_spriteicons, f_grid[a+b*f_roomsizex, 1]+2, dx, dy, 1, 1, 0, c_white, 1);
						//draw_sprite_ext(f_spritetiles, 1, dx, dy, 1, 1, 0, f_tilecol2, 1);
						//draw_sprite_ext(f_spriteicons, f_grid[a+b*f_roomsizex, 1]+2, dx, dy, 1, 1, 0, f_tilecol1, 1);
						//draw_sprite_ext(f_spriteicons, f_grid[a+b*f_roomsizex, 1]+2, dx, dy, 1, 1, 0, c_white, 1);
						break;
					case 7://win10
						var col = c_white;
						if((a+b)%2 == 1)
							col = c_gray;
						draw_sprite_ext(f_spritetiles, 1, dx, dy, 1, 1, 0, col, 1);
						draw_sprite_ext(f_spriteicons, f_grid[a+b*f_roomsizex, 1]+2, dx, dy, 1, 1, 0, c_white, 1);
						break;
				}
			
				gpu_set_blendmode(bm_normal);
			}
			else if(f_grid[a + b*f_roomsizex, 0] == 2) //flagged
			{
				draw_sprite_ext(f_spritetiles, 0, dx, dy, 1, 1, 0, c_white, 1);
				draw_sprite_ext(f_spriteicons, 0, dx, dy, 1, 1, 0, c_white, 1);			
			}
			else if(f_grid[a + b*f_roomsizex, 0] == 3) //questionable
			{
				draw_sprite_ext(f_spritetiles, 0, dx, dy, 1, 1, 0, c_white, 1);
				draw_sprite_ext(f_spriteicons, 1, dx, dy, 1, 1, 0, c_white, 1);			
			}
			else if(f_grid[a + b*f_roomsizex, 0] == 4) //Wr0nk!
			{
				draw_sprite_ext(f_spritetiles, 0, dx, dy, 1, 1, 0, c_white, 1);
				draw_sprite_ext(f_spriteicons, 13, dx, dy, 1, 1, 0, c_white, 1);			
			}
		}
	}
	#endregion
}
else
{
	#region menu
	draw_set_color(f_menucol[f_darkmode]);
	draw_rectangle(8,40, f_roomsizew-8, f_roomsizeh-8, 0);
	draw_set_font(f_menufont);
	var vts = f_roomsizew/232;
	var vmar = vts*16;
	draw_set_color(c_white);
	draw_text_transformed(vmar,32+vmar,"SOUNDS",vts,vts,0);
	draw_sprite_ext(s_menu_box, global.g_sounds, f_roomsizew-vmar, 32+vmar, vts, vts, 0, c_white, 1);
	draw_text_transformed(vmar,32+vmar+20*vts,"THEME",vts,vts,0);
	draw_sprite_ext(s_menu_box, global.g_sounds, f_roomsizew-vmar, 32+vmar+20*vts, vts, vts, 0, c_white, 1);
	draw_text_transformed(vmar,32+vmar+40*vts,"DARKMODE",vts,vts,0);
	draw_sprite_ext(s_menu_box, global.g_sounds, f_roomsizew-vmar, 32+vmar+40*vts, vts, vts, 0, c_white, 1);
	draw_text_transformed(vmar,32+vmar+60*vts,"NEW GAME",vts,vts,0);
//	draw_sprite(s_menu_box, global.g_sounds, f_roomsizew-16, 96);
	#endregion
}
//draw sidebars h
for(var a = 0; a < hbarnum; a++)
{
	for(var b = 0; b < hbarlen; b++)
	{
		draw_sprite(s_sides, 0, b*48, -48-48*a);
		draw_sprite(s_sides, 0, b*48, f_roomsizeh+48*a);
	}
}
// v
for(var a = 0; a < vbarnum; a++)
{
	for(var b = 0; b < vbarlen; b++)
	{
		draw_sprite(s_sides, 0, -48-48*a, b*48);
		draw_sprite(s_sides, 0, f_roomsizew+48*a, b*48);
	}
}

if(global.g_info)
{
	//bottom right text
	draw_set_halign(fa_left);
	draw_set_valign(fa_bottom);	
	if(f_showopened)
		scr_draw_text_ol(25,f_draw_bottom+30,1.1*ttsize,c_black,f_timercol,string(f_gameopened) + "/" + string(f_gameleft));


	//bottom left author
	if(f_showauthor)
	{
		if(f_bgtype == 2 || f_bgtype == 3)
		{
			draw_set_halign(fa_right);
			draw_set_valign(fa_bottom);
			scr_draw_text_ol(f_draw_right+25,f_draw_bottom+30,1.1*ttsize,c_black,f_minescol,f_bgauthor);

			/*
			draw_set_alpha(0.5);
			//if(global.g_darkmode)
				//draw_set_color(c_white);
			draw_set_color(c_black);
			draw_text_transformed(f_draw_right+24,f_draw_bottom+30,f_bgauthor,1.1*ttsize,1.1*ttsize,0);
			draw_text_transformed(f_draw_right+26,f_draw_bottom+30,f_bgauthor,1.1*ttsize,1.1*ttsize,0);
			draw_text_transformed(f_draw_right+25,f_draw_bottom+29,f_bgauthor,1.1*ttsize,1.1*ttsize,0);
			draw_text_transformed(f_draw_right+25,f_draw_bottom+31,f_bgauthor,1.1*ttsize,1.1*ttsize,0);
	
	
			draw_set_alpha(1);
			draw_set_color(c_red);
			draw_text_transformed(f_draw_right+25,f_draw_bottom+30,f_bgauthor,1.1*ttsize,1.1*ttsize,0);
			draw_set_color(c_white);
			*/
		}
	}
}
if(f_tooltip)
{
//	draw_set_font(f_cons);
	var mx = device_mouse_x_to_gui(0);
	var my = device_mouse_y_to_gui(0);
	//if(f_tooltip == ",
	draw_set_halign(fa_right);
	draw_set_valign(fa_top);
	scr_draw_text_ol(mx,my,1.1*ttsize,c_black,tooltip_col,tooltip_text);
	/*
	
	draw_set_color(c_black);
	//draw_rectangle(mx-tooltip_x,my-tooltip_y,mx+2,my+18,0);
	draw_text_transformed(mx-6, my, tooltip_text, ttsize, ttsize, 0);
	draw_text_transformed(mx-2, my, tooltip_text, ttsize, ttsize, 0);
	draw_text_transformed(mx-4, my+2, tooltip_text, ttsize, ttsize, 0);
	draw_text_transformed(mx-4, my-2, tooltip_text, ttsize, ttsize, 0);
	draw_set_color(c_red);
	draw_text_transformed(mx-4, my, tooltip_text, ttsize, ttsize, 0);
	*/
}
//shader_reset();
/*
draw_sprite(s_sides, 0, f_roomsizew, 0);
