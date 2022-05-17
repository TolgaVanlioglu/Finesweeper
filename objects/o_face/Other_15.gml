//save
var foptions_w = file_text_open_write("fs_options.txt");
if(foptions_w != -1)
{
	file_text_write_real(foptions_w, global.g_theme);
	file_text_write_real(foptions_w, global.g_darkmode);
	file_text_write_real(foptions_w, global.g_animations);
	file_text_write_real(foptions_w, global.g_sounds);

	file_text_close(foptions_w);
}