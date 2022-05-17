// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_draw_text_ol(xx, yy, size, colo, coli, text, offs)
{
	if(is_undefined(offs)) offs = 1;
	draw_set_alpha(0.5);
	draw_set_color(colo);
	draw_text_transformed(xx-offs,yy,text,size,size,0);
	draw_text_transformed(xx+offs,yy,text,size,size,0);
	draw_text_transformed(xx,yy-offs,text,size,size,0);
	draw_text_transformed(+xx,yy+offs,text,size,size,0);
	
	
	draw_set_alpha(1);
	draw_set_color(coli);
	draw_text_transformed(xx,yy,text,size,size,0);
	draw_set_color(c_white);
}