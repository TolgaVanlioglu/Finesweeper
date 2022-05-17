f_gamestart = 0;
f_gametimeinc = 0;
f_blink = 7;
for(var a = 0; a < f_roomsizex; a++)
{
	for(var b = 0; b < f_roomsizey; b++)
	{
		f_grid[a + b*f_roomsizex, 0] = 0; //opened
		f_grid[a + b*f_roomsizex, 1] = 1; //mines
	}
}
f_gameminescur = f_gamemines;
f_gametime = 0;
f_gamewon = 0;
f_gamelost = 0;
f_gameopened = 0;
f_gameempties = f_roomsizetot - f_gamemines;

do
{
	f_rmode = irandom(3);
	f_gmode = irandom(3);
	f_bmode = irandom(3);
}until(f_rmode != f_gmode && f_rmode != f_bmode && f_gmode != f_bmode);

if(global.g_theme == 1)
{
	f_timercol = make_color_hsv((color_get_hue(f_timercol)+16)%256,255,255);
	f_minescol = make_color_rgb(255-color_get_red(f_timercol),255-color_get_green(f_timercol),255-color_get_blue(f_timercol));
	f_timercolmain = f_timercol;
	f_minescolmain = f_minescol;
}
else if(global.g_theme == 4)
{
	f_cols[0] = 0;
	f_cols[1] = 0;
	f_cols[2] = 0;
	var vcol = irandom(2);
	f_col1 = vcol;//global.g_colors[vcol];
	f_col2 = scr_indexer(vcol+choose(-1,1),3);//global.g_colors[(vcol+1)%6];
	f_cols[vcol] = 255;
	f_timercol = make_color_rgb(f_cols[0],f_cols[1],f_cols[2]);
	f_cols[f_col2] = 255;
	f_minescol = make_color_rgb(f_cols[0],f_cols[1],f_cols[2]);
	f_timercolmain = f_timercol;
	f_minescolmain = f_minescol;
}