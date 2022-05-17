// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_colmode(r_mode, g_mode, b_mode, offset)
{
	var r=0, g=0, b=0;
	switch(r_mode)
	{
		case 0:
			r = 0;
			break;
		case 1:
			r = 255;
			break;
		case 2:
			r = offset;
			break;
		case 3:
			r = 255-offset;
			break;
	}
	
	switch(g_mode)
	{
		case 0:
			g = 0;
			break;
		case 1:
			g = 255;
			break;
		case 2:
			g = offset;
			break;
		case 3:
			g = 255-offset;
			break;
	}
	
	switch(b_mode)
	{
		case 0:
			b = 0;
			break;
		case 1:
			b = 255;
			break;
		case 2:
			b = offset;
			break;
		case 3:
			b = 255-offset;
			break;
	}
	
	return make_color_rgb(r,g,b);
}