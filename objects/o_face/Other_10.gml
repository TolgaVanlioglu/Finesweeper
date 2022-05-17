var minesleft = f_gamemines;
f_gamestart = 1;
f_gametimeinc = 1;
f_starttime = date_current_datetime();

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
	if(f_gamemines < f_roomsizetot-8)
	{
		do
		{
			var minexy = irandom(f_roomsizex-1) + f_roomsizex*irandom(f_roomsizey-1);
		}until(f_grid[minexy, 1] != 0 && minexy != mouse_mine && minexy != mouse_mine-1-f_roomsizex && minexy != mouse_mine-f_roomsizex && minexy != mouse_mine+1-f_roomsizex && minexy != mouse_mine-1 && minexy != mouse_mine+1 && minexy != mouse_mine-1+f_roomsizex && minexy != mouse_mine+f_roomsizex && minexy != mouse_mine+1+f_roomsizex);
	}
	else
	{
		do
		{
			var minexy = irandom(f_roomsizex-1) + f_roomsizex*irandom(f_roomsizey-1);
		}until(f_grid[minexy, 1] != 0 && minexy != mouse_mine);
	}
	f_grid[minexy, 1] = 0;
	f_minelocs[minesleft-1] = minexy;
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