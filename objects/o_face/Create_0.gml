randomize();

f_roomsizex = global.g_minex;
f_roomsizey = global.g_miney;
f_gamemines = global.g_mines;
f_roomsizetot = f_roomsizex * f_roomsizey;

f_gameminescur = f_gamemines;

f_gamestart = 0;
f_gameempties = f_roomsizetot - f_gamemines;
f_gameopened = 0;
f_gameleft = f_roomsizex*f_roomsizey - f_gamemines;
f_gamewon = 0;
f_gamelost = 0;
f_gametime = 0;
f_gametimeinc = 0;

f_openanimation = global.g_animations;
f_instant = !f_openanimation;
f_bgtype = global.g_theme;
//0 normal, 1 rainbow, 2 pic, 3 tpic, 4 2colors, 6 3d, 7 modern
f_darkmode = global.g_darkmode;

f_minelocs = array_create(f_gamemines, 0);
f_roomsizew = 24 + 36*f_roomsizex;
f_roomsizeh = 72 + 36*f_roomsizey;

f_menu = 0;
f_menucol[0] = make_color_rgb(137, 137, 137);
f_menucol[1] = make_color_rgb(69, 69, 69);
f_menukeepratio = 0;
show_debug_message(ord("a"));
f_draw_right = f_roomsizew-48;
f_draw_bottom = f_roomsizeh-48;


f_bgframe = irandom(array_length(global.g_bgauthorlist)-1);
f_bgauthor = "By: " + global.g_bgauthorlist[f_bgframe];
f_bgx = f_roomsizew/2;
f_bgy = 60 + 18*f_roomsizey;
f_starttime = 0;

hbarnum = 0;
vbarnum = 0;
hbarlen = ceil(f_roomsizew/32);
vbarlen = ceil(f_roomsizeh/32);
mm_hh = 0;
mouse_mine = 0;
tooltip_text = "";
tooltip_col = c_white;
tooltip_x = 0;
tooltip_y = 0;
f_tooltip = 0;
f_showauthor = 1;
f_showopened = 1;

f_tilecol1 = c_red;
f_tilecol2 = c_aqua;

f_col1 = c_white;
f_col2 = c_white;
f_timercol = c_red;
f_minescol = c_red;
f_timercolmain = f_timercol;
f_minescolmain = f_minescol;
f_blink = 5;
f_rainbowoffs = f_roomsizex*4.2;
f_pitch = 0;
f_changedmonly = 0;

if(f_roomsizex > f_roomsizey)
{
	bgscale = (36*f_roomsizex)/(738);
}
else
{
	bgscale = (36*f_roomsizey)/(738);
}

f_spriteframe = s_frame;
f_spritetiles = s_tiles;
f_spriteicons = s_icons_col;
f_spritebutttiles = s_butttiles;
f_spritedigits = s_digits;

f_bgc = 0;

event_user(4);
//audio_set_master_gain(0,0);
scsize = 1;//0.5;
ttsize = 1;
if(f_roomsizeh*scsize > display_get_height()-100 || f_roomsizew*scsize > display_get_width()-50)
{
	scsize = 0.75;
	ttsize = 1.5;
}
if(f_roomsizeh*scsize > display_get_height()-100 || f_roomsizew*scsize > display_get_width()-50)
{
	scsize = 0.5;
	ttsize = 2;
}
if(f_roomsizeh*scsize > display_get_height()-100 || f_roomsizew*scsize > display_get_width()-50)
{
	scsize = 0.25;
	ttsize = 4;
}
window_set_size(f_roomsizew*scsize, f_roomsizeh*scsize);
view_set_wport(view_camera[0], f_roomsizew*scsize);
view_set_hport(view_camera[0], f_roomsizeh*scsize);
//camera_set_view_pos(view_camera[0], 0, 0)
for(var a = 0; a < f_roomsizex; a++)
{
	for(var b = 0; b < f_roomsizey; b++)
	{
		f_grid[a + b*f_roomsizex, 0] = 0; //opened
		f_grid[a + b*f_roomsizex, 1] = 1; //mines
	}
}

/*
for(var a = 0; a < f_roomsizex; a++)
{
	for(var b = 0; b < f_roomsizey; b++)
	{
		f_grid[a + b*f_roomsizex, 0] = 0; //opened
		f_grid[a + b*f_roomsizex, 1] = 1; //mines
	}
}

do
{
	do
	{
		var minexy = irandom(f_roomsizex-1) + f_roomsizex*irandom(f_roomsizey-1);
	}until(f_grid[minexy, 1] != 0);
	f_grid[minexy, 1] = 0;
	minesleft--;

}until(minesleft == 0);

for(var a = 0; a < f_roomsizetot; a++)
{
	if(f_grid[a, 1] > 0)
	{
		if(a >= f_roomsizex)
		{
			f_grid[a, 1] += (f_grid[a-f_roomsizex, 1] == 0);
			if(a % f_roomsizex != 0)
				f_grid[a, 1] += (f_grid[a-1-f_roomsizex, 1] == 0);
			if(a % f_roomsizex != f_roomsizex - 1)
				f_grid[a, 1] += (f_grid[a+1-f_roomsizex, 1] == 0);
		}
		if(floor(a/f_roomsizex) < f_roomsizey-1)
		{
			f_grid[a, 1] += (f_grid[a+f_roomsizex, 1] == 0);
			if(a % f_roomsizex != 0)
				f_grid[a, 1] += (f_grid[a-1+f_roomsizex, 1] == 0);
			if(a % f_roomsizex != f_roomsizex - 1)
				f_grid[a, 1] += (f_grid[a+1+f_roomsizex, 1] == 0);
		}
		if(a % f_roomsizex != 0)
				f_grid[a, 1] += (f_grid[a-1, 1] == 0);
		if(a % f_roomsizex != f_roomsizex - 1)
			f_grid[a, 1] += (f_grid[a+1, 1] == 0);		
	}
}