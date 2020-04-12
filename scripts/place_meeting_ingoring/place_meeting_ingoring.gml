var list = ds_list_create();
var lsize = pointer_null;
var list0 = pointer_null;

lsize = instance_place_list(argument0, argument1, argument2, list, false); //It returns number of objects it will collide with
list0 = ds_list_find_value(list, 0);
ds_list_destroy(list);

if (( lsize == 1 and list0 == argument3) or (lsize == 0))
	return false;
else
	return true;
	
