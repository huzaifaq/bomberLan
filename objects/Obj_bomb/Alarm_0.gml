var explosion = instance_create_layer(x,y,"Bombs",Obj_explosion);
explosion.bombOwnerId = bombOwnerId;
explosion.expDirection = UP | DOWN | LEFT | RIGHT;
explosion.expSize = 2;
instance_destroy();
