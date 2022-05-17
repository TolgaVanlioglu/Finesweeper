audio_play_sound(so_button,0,0);
event_user(1);
f_bgframe = irandom(array_length(global.g_bgauthorlist)-1);
f_bgauthor = "By: "+global.g_bgauthorlist[f_bgframe];