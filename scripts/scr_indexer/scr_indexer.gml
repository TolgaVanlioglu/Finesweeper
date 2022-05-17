// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_indexer(ind,maxind)
{
	if(ind < 0)
		return maxind + ind;
	else
		return ind % maxind;
}