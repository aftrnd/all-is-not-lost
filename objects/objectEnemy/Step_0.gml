horizontalSpeed = walkSpeed;
verticalSpeed = verticalSpeed + gravityAmmount;

//Double Jump
//if(keyboardUp)
//{
//    verticalSpeed = -3.5;
//	  audio_play_sound(soundJump, 999, false);
//}

if(place_meeting(x, y + verticalSpeed, objectWall))
{
    while(!place_meeting(x, y + sign(verticalSpeed), objectWall))
    {
        y += sign(verticalSpeed);
    }
	
    verticalSpeed = 0;
}

y += verticalSpeed;

//Horizontal Collision
if (place_meeting(x + horizontalSpeed, y, objectWall))
{
	while (!place_meeting(x + sign(horizontalSpeed), y, objectWall))
	{
		x = x + sign(horizontalSpeed);
	}
	verticalSpeed = jumpHeight;
	horizontalSpeed = 0;
}

x = x + horizontalSpeed;

//Vertical Collision
if (place_meeting(x, y + verticalSpeed, objectWall))
{
	while (!place_meeting(x, y + sign(verticalSpeed), objectWall))
	{
		y = y + sign(verticalSpeed);
	}
	collisionCount = collisionCount + 1;
	verticalSpeed = 0;
}

if (collisionCount == 16)
{
	walkSpeed = -walkSpeed;
	collisionCount = 0;
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