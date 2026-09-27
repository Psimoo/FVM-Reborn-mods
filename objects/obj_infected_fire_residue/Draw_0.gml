// Inherit the parent event
event_inherited();
if state == BOSS_STATE.STUN{
	draw_sprite_ext(spr_mouse_stun,(floor(timer/5) mod 7),x-30,y-220,1.8,1.8,0,c_white,1)
}
