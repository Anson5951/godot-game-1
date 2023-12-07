extends Button



# Called when the node enters the scene tree for the first time.
func _ready():
	self.pressed.connect(func(): calculate())

func calculate():
	var pads = [
		"/root/action_area/pad1",
		"/root/action_area/pad2",
		"/root/action_area/pad3",
		"/root/action_area/pad4",
		"/root/action_area/pad5",
	]
	var single_target_attack_times = {
		 "dark" : 0,
		 "fire" : 0,
		 "heart" : 0,
		 "light" : 0,
		 "none" : 0,
		 "water" : 0,
		 "wind" : 0,
	}
	var multiple_targets_attack_times = {
		"dark" : 0,
		"fire" : 0,
		"heart" : 0,
		"light" : 0,
		"none" : 0,
		"water" : 0,
		"wind" : 0,
	}
	for pad in pads:
		var element_names = get_node(pad).placed_element_names
		print(element_names)
		var number_of_dark = element_names.filter(func(element_name): return element_name.begins_with('dark')).size()
		var number_of_fire = element_names.filter(func(element_name): return element_name.begins_with('fire')).size()
		var number_of_heart = element_names.filter(func(element_name): return element_name.begins_with('heart')).size()
		var number_of_light = element_names.filter(func(element_name): return element_name.begins_with('light')).size()
		var number_of_none = element_names.filter(func(element_name): return element_name.begins_with('none')).size()
		var number_of_water = element_names.filter(func(element_name): return element_name.begins_with('water')).size()
		var number_of_wind = element_names.filter(func(element_name): return element_name.begins_with('wind')).size()
		print('number to add:  ', 
			'dark: ', (number_of_dark), ', ',
			'fire: ', (number_of_fire), ', ',
			'heart: ', (number_of_heart), ', ',
			'light: ', (number_of_light), ', ',
			'none: ', (number_of_none), ', ',
			'water: ', (number_of_water), ', ',
			'wind: ', (number_of_wind), ', '
			)
		print('attacks to add: ', 
			'dark: ', (number_of_dark / 2), ', ',
			'fire: ', (number_of_fire / 2), ', ',
			'heart: ', (number_of_heart / 2), ', ',
			'light: ', (number_of_light / 2), ', ',
			'none: ', (number_of_none / 2), ', ',
			'water: ', (number_of_water / 2), ', ',
			'wind: ', (number_of_wind / 2), ', '
			)
		single_target_attack_times.dark += (number_of_dark / 2)
		single_target_attack_times.fire += (number_of_fire / 2)
		single_target_attack_times.heart += (number_of_heart / 2)
		single_target_attack_times.light += (number_of_light / 2)
		single_target_attack_times.none += (number_of_none / 2)
		single_target_attack_times.water += (number_of_water / 2)
		single_target_attack_times.wind += (number_of_wind / 2)
		
		multiple_targets_attack_times.dark += (number_of_dark / 4)
		multiple_targets_attack_times.fire += (number_of_fire / 4)
		multiple_targets_attack_times.heart += (number_of_heart / 4)
		multiple_targets_attack_times.light += (number_of_light / 4)
		multiple_targets_attack_times.none += (number_of_none / 4)
		multiple_targets_attack_times.water += (number_of_water / 4)
		multiple_targets_attack_times.wind += (number_of_wind / 4)
	print('single target attacks: ')
	print('dark: ', single_target_attack_times.dark)
	print('fire: ', single_target_attack_times.fire)	
	print('heart: ', single_target_attack_times.heart)	
	print('light: ', single_target_attack_times.light)	
	print('none: ', single_target_attack_times.none)	
	print('water: ', single_target_attack_times.water)	
	print('wind: ', single_target_attack_times.wind)	
	print('multiple targets attacks: ')
	print('dark: ', multiple_targets_attack_times.dark)
	print('fire: ', multiple_targets_attack_times.fire)	
	print('heart: ', multiple_targets_attack_times.heart)	
	print('light: ', multiple_targets_attack_times.light)	
	print('none: ', multiple_targets_attack_times.none)	
	print('water: ', multiple_targets_attack_times.water)	
	print('wind: ', multiple_targets_attack_times.wind)	
		
