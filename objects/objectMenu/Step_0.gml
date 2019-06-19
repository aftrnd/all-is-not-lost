/// @description Insert description here
// You can write your code in this editor

//Keyboard
if (menu_control)
{
	if (keyboard_check_pressed(vk_up))
	{
		menu_cursor++;
		if (menu_cursor >= menu_items) menu_cursor = 0;
	}
	
	if (keyboard_check_pressed(vk_down))
	{
		menu_cursor--;
		if (menu_cursor < 0) menu_cursor = - 1;
	}
	
	if (keyboard_check_pressed(vk_enter))
	{
		menu_x_target = gui_width;
		menu_committed = menu_cursor;
		menu_control = false;
		
	}
	
}

if (menu_committed != -1)
{
	switch (menu_committed)
	{
		case 2: default: room_goto(room1);
		case 0: game_end(); break;
		
	}
	
	
}