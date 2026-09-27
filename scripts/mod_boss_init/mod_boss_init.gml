function mod_boss_init()
{
    register_boss("infected_mario_mouse", 
    {
        name: "变异洞君",
        hp: 20000,
        icon: spr_mario_mouse_icon
    });
    register_boss("infected_arno", 
    {
        name: "变异阿诺",
        hp: 18000,
        icon: spr_arno_icon
    });
    register_boss("infected_fire_residue", 
    {
        name: "感染火渣",
        hp: 12000,
        icon: spr_infected_bingzha_icon
    });
}
