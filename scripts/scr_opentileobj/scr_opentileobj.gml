// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_opentileobj(mine, inst, sound)
{
	if(is_undefined(sound)) sound = 1;
	if(!inst)
	{
		with(instance_create_depth(0, 0, 0, o_opentile))
		{
			alarm[0] = 6+irandom_range(-3,3);
			omine = mine;
		}
	}
	else
	{
		scr_opentile(mine, sound);
	}
}