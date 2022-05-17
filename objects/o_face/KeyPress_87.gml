var scsize = irandom_range(5,10);
window_set_size(f_roomsizew*scsize, f_roomsizeh*scsize);
view_set_wport(view_camera[0], f_roomsizew*scsize);
view_set_hport(view_camera[0], f_roomsizeh*scsize);