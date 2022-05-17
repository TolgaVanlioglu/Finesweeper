/*
var spt = num_sprites;
repeat(3)
with(instance_create_depth(irandom(draw_centerx*2-36),-36,depth,o_number))
{
	image_xscale = 0.3//0.3+random(0.3);//irandom_range(1,5);
	image_yscale = image_xscale;//irandom_range(1,5);
	sprite_index = spt;
	image_index = irandom_range(4,11);
	vspeed = random(1);
	image_speed = 0;
}

if(enable)
	alarm[1] = 10;