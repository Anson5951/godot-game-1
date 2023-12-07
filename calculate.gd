extends Button


var number_of_elements = {
	 "dark" : 0,
	 "fire" : 0,
	 "heart" : 0,
	 "light" : 0,
	 "none" : 0,
	 "water" : 0,
	 "wind" : 0,
}
var normal_skill_1 = {
	 "dark" : 0,
	 "fire" : 0,
	 "heart" : 0,
	 "light" : 0,
	 "none" : 0,
	 "water" : 0,
	 "wind" : 0,
}
var normal_skill_2 = {
	"dark" : 0,
	"fire" : 0,
	"heart" : 0,
	"light" : 0,
	"none" : 0,
	"water" : 0,
	"wind" : 0,
}
	
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
	for pad in pads:
		var element_names = get_node(pad).placed_element_names
		number_of_elements.dark = element_names.filter(func(element_name): return element_name.begins_with('dark')).size()
		number_of_elements.fire = element_names.filter(func(element_name): return element_name.begins_with('fire')).size()
		number_of_elements.heart = element_names.filter(func(element_name): return element_name.begins_with('heart')).size()
		number_of_elements.light = element_names.filter(func(element_name): return element_name.begins_with('light')).size()
		number_of_elements.none = element_names.filter(func(element_name): return element_name.begins_with('none')).size()
		number_of_elements.water = element_names.filter(func(element_name): return element_name.begins_with('water')).size()
		number_of_elements.wind = element_names.filter(func(element_name): return element_name.begins_with('wind')).size()
		print('number of elements:  ', 
			'dark: ', (number_of_elements.dark), ', ',
			'fire: ', (number_of_elements.fire), ', ',
			'heart: ', (number_of_elements.heart), ', ',
			'light: ', (number_of_elements.light), ', ',
			'none: ', (number_of_elements.none), ', ',
			'water: ', (number_of_elements.water), ', ',
			'wind: ', (number_of_elements.wind), ', '
			)
		calculate_normal_skill_2_rule()
		calculate_normal_skill_1_rule()
			
	print('normal_skill_1: ')
	print('dark: ', normal_skill_1['dark'])
	print('fire: ', normal_skill_1['fire'])	
	print('heart: ', normal_skill_1['heart'])	
	print('light: ', normal_skill_1['light'])	
	print('none: ', normal_skill_1['none'])	
	print('water: ', normal_skill_1['water'])	
	print('wind: ', normal_skill_1['wind'])	
	print('normal_skill_2: ')
	print('dark: ', normal_skill_2['dark'])
	print('fire: ', normal_skill_2['fire'])	
	print('heart: ', normal_skill_2['heart'])	
	print('light: ', normal_skill_2['light'])	
	print('none: ', normal_skill_2['none'])	
	print('water: ', normal_skill_2['water'])	
	print('wind: ', normal_skill_2['wind'])	

# rules from character might be {dark: 2} or {dark: 1, light: 1}
func calculate_normal_skill_1_rule():
	# 假設全部屬性都能觸發normal skill 1
	if number_of_elements.dark >= 2:
		normal_skill_1.dark += 1
		number_of_elements.dark -=2
		
	if number_of_elements.fire >= 2:
		normal_skill_1.fire += 1
		number_of_elements.fire -=2
		
	if number_of_elements.heart >= 2:
		normal_skill_1.heart += 1
		number_of_elements.heart -=2
		
	if number_of_elements.heart >= 2:
		normal_skill_1.heart += 1
		number_of_elements.heart -=2
		
	if number_of_elements.light >= 2:
		normal_skill_1.light += 1
		number_of_elements.light -=2
		
	if number_of_elements.none >= 2:
		normal_skill_1.none += 1
		number_of_elements.none -=2
		
	if number_of_elements.water >= 2:
		normal_skill_1.water += 1
		number_of_elements.water -=2
	
	if number_of_elements.wind >= 2:
		normal_skill_1.wind += 1
		number_of_elements.wind -=2
	pass

func calculate_normal_skill_2_rule():	
	# 假設全部屬性都能觸發normal skill 2
	if number_of_elements.dark >= 4:
		normal_skill_2.dark += 1
		number_of_elements.dark -=4
		
	if number_of_elements.fire >= 4:
		normal_skill_2.fire += 1
		number_of_elements.fire -=4
		
	if number_of_elements.heart >= 4:
		normal_skill_2.heart += 1
		number_of_elements.heart -=4
		
	if number_of_elements.heart >= 4:
		normal_skill_2.heart += 1
		number_of_elements.heart -=4
		
	if number_of_elements.light >= 4:
		normal_skill_2.light += 1
		number_of_elements.light -=4
		
	if number_of_elements.none >= 4:
		normal_skill_2.none += 1
		number_of_elements.none -=4
		
	if number_of_elements.water >= 4:
		normal_skill_2.water += 1
		number_of_elements.water -=4
	
	if number_of_elements.wind >= 4:
		normal_skill_2.wind += 1
		number_of_elements.wind -=4
	pass
