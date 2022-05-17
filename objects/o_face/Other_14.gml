//update theme

do
{
	f_rmode = irandom(3);
	f_gmode = irandom(3);
	f_bmode = irandom(3);
}until(f_rmode != f_gmode && f_rmode != f_bmode && f_gmode != f_bmode);
/*		
if(f_darkmode)
{
	f_spritetiles = s_tiles_dark;
	f_spriteframe = s_frame_dark;
	f_spritebutttiles = s_butttiles_dark;
}
else
{
	f_spritetiles = s_tiles;
	f_spriteframe = s_frame;
	f_spritebutttiles = s_butttiles;
}
*/

switch(f_bgtype)
{
	case 1: case 4: case 5:
		if(!f_changedmonly)
		{
			f_timercol = make_color_hsv(irandom(255),255,255);
			f_minescol = make_color_rgb(255-color_get_red(f_timercol),255-color_get_green(f_timercol),255-color_get_blue(f_timercol));
			f_timercolmain = f_timercol;
			f_minescolmain = f_minescol;
		}
		f_spriteicons = s_icons_white;
		f_spritedigits = s_digits_rb;
		if(f_darkmode)
		{
			f_spritetiles = s_tiles_dark_rb;
			f_spriteframe = s_frame_dark;
			f_spritebutttiles = s_butttiles_dark_rb;
		}
		else
		{
			f_spritetiles = s_tiles_rb;
			f_spriteframe = s_frame;
			f_spritebutttiles = s_butttiles_rb;
		}
		break;
	case 2: case 3: //picture tiled/plain
		f_spriteicons = s_icons_bright;
		f_spritedigits = s_digits;
		if(f_darkmode)
		{
			f_timercol = make_color_rgb(229,68,68);
			f_minescol = f_timercol;
			f_timercolmain = f_timercol;
			f_minescolmain = f_minescol;
			f_spritetiles = s_tiles_dark;
			f_spriteframe = s_frame_dark;
			f_spritebutttiles = s_butttiles_dark;
		}
		else
		{
			f_timercol = c_red;
			f_minescol = c_red;
			f_timercolmain = f_timercol;
			f_minescolmain = f_minescol;
			f_spritetiles = s_tiles;
			f_spriteframe = s_frame;
			f_spritebutttiles = s_butttiles;
		}
		break;
	case 6: //3d
		f_spriteicons = s_icons_white;
		f_spritedigits = s_digits_rb;
		if(f_darkmode)
		{
			f_spritetiles = s_tiles_dark_rb;
			f_spriteframe = s_frame_dark;
			f_spritebutttiles = s_butttiles_dark_rb;
		}
		else
		{
			f_spritetiles = s_tiles_3d;
			f_spriteframe = s_frame;
			f_spritebutttiles = s_butttiles_modern;
		}
		break;
	case 7: //win10
		f_spriteicons = s_icons_white;
		f_spritedigits = s_digits_rb;
		if(f_darkmode)
		{
			f_spritetiles = s_tiles_dark_rb;
			f_spriteframe = s_frame_dark;
			f_spritebutttiles = s_butttiles_dark_rb;
		}
		else
		{
			f_spritetiles = s_tiles_modern;
			f_spriteframe = s_frame;
			f_spritebutttiles = s_butttiles_modern;
		}
		break;
	default:
		f_timercol = c_red;
		f_minescol = c_red;
		f_timercolmain = f_timercol;
		f_minescolmain = f_minescol;
		
		f_spritedigits = s_digits;
		if(f_darkmode)
		{
			f_timercol = make_color_rgb(229,68,68);
			f_minescol = f_timercol;
			f_timercolmain = f_timercol;
			f_minescolmain = f_minescol;
			f_spritetiles = s_tiles_dark;
			f_spriteframe = s_frame_dark;
			f_spritebutttiles = s_butttiles_dark;
			f_spriteicons = s_icons_col_dark;
		}
		else
		{
			f_timercol = c_red;
			f_minescol = c_red;
			f_timercolmain = f_timercol;
			f_minescolmain = f_minescol;
			f_spritetiles = s_tiles;
			f_spriteframe = s_frame;
			f_spritebutttiles = s_butttiles;
			f_spriteicons = s_icons_col;
		}
}


if(!f_changedmonly && global.g_theme == 4)
{
	f_cols[0] = 0;
	f_cols[1] = 0;
	f_cols[2] = 0;
	var vcol = irandom(2);
	f_col1 = vcol;//global.g_colors[vcol];
	f_col2 = scr_indexer(vcol+choose(-1,1),3);//global.g_colors[(vcol+1)%6];
	if(irandom(1))
	{
		f_cols[vcol] = 255;
		f_timercol = make_color_rgb(f_cols[0],f_cols[1],f_cols[2]);
		f_cols[f_col2] = 255;
		f_minescol = make_color_rgb(f_cols[0],f_cols[1],f_cols[2]);
	}
	else
	{
		f_cols[f_col2] = 255;
		f_timercol = make_color_rgb(f_cols[0],f_cols[1],f_cols[2]);
		f_cols[vcol] = 255;
		f_minescol = make_color_rgb(f_cols[0],f_cols[1],f_cols[2]);
	}
	f_timercolmain = f_timercol;
	f_minescolmain = f_minescol;
}