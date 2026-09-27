// Inherit the parent event
event_inherited();

if instance_exists(up_inst){
	draw_sprite_ext(spr_infected_zhanshen_rope_up,0,x-30,y-100,1.8,1.8,0,c_white,1)
}
if instance_exists(down_inst){
	draw_sprite_ext(spr_infected_zhanshen_rope_down,0,x-30,y-100,1.8,1.8,0,c_white,1)
}