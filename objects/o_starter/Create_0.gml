var foptions_r = file_text_open_read("fs_options.txt");
show_debug_message(foptions_r);
if(foptions_r == -1)
{
	show_debug_message("no file");
	var foptions_w = file_text_open_write("fs_options.txt");
	file_text_write_real(foptions_w, 0);
	file_text_writeln(foptions_w);
	file_text_write_real(foptions_w, 0);
	file_text_writeln(foptions_w);
	file_text_write_real(foptions_w, 1);
	file_text_writeln(foptions_w);
	file_text_write_real(foptions_w, 4);
	file_text_writeln(foptions_w);
	file_text_write_real(foptions_w, 1);
	file_text_writeln(foptions_w);
	
	file_text_close(foptions_w);
	
	global.g_theme = 0;
	global.g_darkmode = 0;
	global.g_animations = 1;
	global.g_sounds = 4;
	global.g_info = 1;
}
else
{
	global.g_theme = file_text_read_real(foptions_r);
	file_text_readln(foptions_r);
	global.g_darkmode = file_text_read_real(foptions_r);
	file_text_readln(foptions_r);
	global.g_animations = file_text_read_real(foptions_r);
	file_text_readln(foptions_r);
	global.g_sounds = file_text_read_real(foptions_r);
	file_text_readln(foptions_r);
	global.g_info = file_text_read_real(foptions_r);
	
	file_text_close(foptions_r);
	show_debug_message("yes file");
}
global.g_minex = 9;
global.g_miney = 9;
global.g_mines = 10;

audio_master_gain(global.g_sounds*0.25);

global.g_colors[0] = c_red;
global.g_colors[1] = c_yellow;
global.g_colors[2] = c_lime;
global.g_colors[3] = c_aqua;
global.g_colors[4] = c_blue;
global.g_colors[5] = c_fuchsia;

global.g_bgauthorlist = array_create(4,"woooooooooooooooooooo");
global.g_bgauthorlist[0] = "Mr. Cres";
global.g_bgauthorlist[1] = "Mr. Cres";
global.g_bgauthorlist[2] = "THEDSYT";
global.g_bgauthorlist[3] = "THEDSYT";
global.g_bgauthorlist[4] = "THEDSYT";
global.g_bgauthorlist[5] = "Tsuki";
global.g_bgauthorlist[6] = "Tsuki";
global.g_bgauthorlist[7] = "Tsuki";
global.g_bgauthorlist[8] = "Tsuki";
global.g_bgauthorlist[9] = "Tsuki";
global.g_bgauthorlist[10] = "Tsuki";
global.g_bgauthorlist[11] = "Tsuki";
global.g_bgauthorlist[12] = "Tsuki";
global.g_bgauthorlist[13] = "Tsuki";
global.g_bgauthorlist[14] = "Tsuki";
global.g_bgauthorlist[15] = "Tsuki";
global.g_bgauthorlist[16] = "Tsuki";
global.g_bgauthorlist[17] = "Tsuki";
global.g_bgauthorlist[18] = "Tsuki";
global.g_bgauthorlist[19] = "Tsuki";
global.g_bgauthorlist[20] = "Cengizhan";
global.g_bgauthorlist[21] = "Cengizhan";
global.g_bgauthorlist[22] = "Cengizhan";

instance_create_depth(0, 0, depth, o_face);

c = 0;
drag = 0;
enable = 0;
warning = 0;
bg_mode = 0;
sel_diff = 0;
buttoffs = 0;
mouse_mode = 0;
c_gri = make_color_rgb(128,128,128);
spr_tiles = s_tiles;
spr_icons = s_icons_col;
spr_bg = s_background;
draw_set_font(f_cons);
//slider_mx = slider_centerx + 2*global.g_minex-40;
//slider_my = slider_centerx + 2*global.g_miney-40;
//slider_ms = slider_centerx + 2*global.g_mines-40;