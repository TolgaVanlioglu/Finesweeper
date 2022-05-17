function scr_square_dist(x1, y1, x2, y2, maxix, maxiy)
{
	return (abs(x1-x2) < maxix) && (abs(y1-y2) < maxiy);
}