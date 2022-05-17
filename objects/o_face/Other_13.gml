global.g_minex = get_integer("width", 9);
global.g_miney = get_integer("height", 9);
global.g_mines = get_integer("mines", 10);
f_roomsizetot = f_roomsizex * f_roomsizey;

event_perform(ev_create, 0);