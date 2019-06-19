if (done == 0)
{
	verticalSpeed = verticalSpeed + gravityAmmount;

	//Horizontal Collision
	if (place_meeting(x + horizontalSpeed, y, objectWall))
	{
		while (!place_meeting(x + sign(horizontalSpeed), y, objectWall))
		{
			x = x + sign(horizontalSpeed);
		}
		horizontalSpeed = 0;
	}

	x = x + horizontalSpeed;

	//Vertical Collision
	if (place_meeting(x, y + verticalSpeed, objectWall))
	{
		if (verticalSpeed > 0)
		{
			done = 1;
			image_index = 1;
		}
		while (!place_meeting(x, y + sign(verticalSpeed), objectWall))
		{
			y = y + sign(verticalSpeed);
		}
		verticalSpeed = 0;
	}

	y = y + verticalSpeed;
}