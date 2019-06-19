verticalSpeed = verticalSpeed + gravityAmmount;

//Horizontal Collision
if (place_meeting(x + horizontalSpeed, y, objectWall))
{
	while (!place_meeting(x + sign(horizontalSpeed), y, objectWall))
	{
		x = x + sign(horizontalSpeed);
	}
	horizontalSpeed = -horizontalSpeed;
}

x = x + horizontalSpeed;

//Vertical Collision
if (place_meeting(x, y + verticalSpeed, objectWall))
{
	while (!place_meeting(x, y + sign(verticalSpeed), objectWall))
	{
		y = y + sign(verticalSpeed);
	}
	verticalSpeed = 0;
}

y = y + verticalSpeed;

//Sprite Animation
if (!place_meeting(x, y + 1, objectWall))
{
	sprite_index = spriteEnemyJump;
	image_speed = 0;
	if (sign(verticalSpeed) > 0) image_index = 1; else image_index = 0;
	
}
else
{
	image_speed = 1;
	if (horizontalSpeed == 0)
	{
		sprite_index = spriteEnemy;
	}
	else
	{
			sprite_index = spriteEnemyRunning;
	}
}

if (horizontalSpeed != 0) image_xscale = sign(horizontalSpeed);