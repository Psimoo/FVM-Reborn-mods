if (pooled){
	exit
}
if global.is_paused{
	exit
}
timer ++
image_index = floor(timer/3)
if timer >= 18{
    if (pooled_managed) {
        pool_release(id)
    } else {
        instance_destroy()
    }
}