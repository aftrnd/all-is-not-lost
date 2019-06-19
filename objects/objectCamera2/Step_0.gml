if (instance_exists(follow))
{
	xTo = follow.x;
	yTo = follow.y;
}

x += (xTo - x) / 16;
y += (yTo - y) / 16;

camera_set_view_pos(camera2, x - view_width_half, y - view_height_half);
