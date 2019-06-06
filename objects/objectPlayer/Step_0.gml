//Keyboard Input
keyboardLeft = keyboard_check(vk_left);
keyboardRight = keyboard_check(vk_right);
keyboardUp = keyboard_check_pressed(vk_up);

//Calculate Movement
var move = keyboardRight - keyboardLeft;

horizontalSpeed = move * walkSpeed;
verticalSpeed = verticalSpeed + gravityAmmount;

//Double Jump
if(keyboardUp) && (jumpCurrent > 0)
{
    verticalSpeed = -6;
    jumpCurrent--;
}

if(place_meeting(x, y + verticalSpeed, objectWall))
{
    while(!place_meeting(x, y + sign(verticalSpeed), objectWall))
    {
        y += sign(verticalSpeed);
    }
 
    if(verticalSpeed > 0)
    {
        jumpCurrent = jumpNumber;
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
	verticalSpeed = 0;
}

y = y + verticalSpeed;

//Sprite Animation
if (!place_meeting(x, y + 1, objectWall))
{
	sprite_index = spritePlayerJump;
	image_speed = 0;
	if (sign(verticalSpeed) > 0) image_index = 1; else image_index = 0;
	
}
else
{
	image_speed = 1;
	if (horizontalSpeed == 0)
	{
		sprite_index = spritePlayer;
	}
	else
	{
			sprite_index = spritePlayerRunning;
	}
}

if (horizontalSpeed != 0) image_xscale = sign(horizontalSpeed);