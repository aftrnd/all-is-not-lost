if (enemyHealth <= 0)
{
	with(instance_create_layer(x, y, layer, objectDead))
	{
		direction = other.hitFrom;
		horizontalSpeed = lengthdir_x(3, direction);
		verticalSpeed = lengthdir_y(3, direction) - 3;
	
		if (sign(horizontalSpeed) != 0) image_xscale = sign(horizontalSpeed);
	}
	
	instance_destroy();
}