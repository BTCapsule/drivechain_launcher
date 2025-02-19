extends PanelContainer

@onready var dashboard_button := $MarginContainer/HBox/DashboardButton
@onready var playground_button := $MarginContainer/HBox/PlaygroundButton
@onready var settings_button := $MarginContainer/HBox/SettingsButton

signal left_menu_button_pressed(v: int)

func _on_left_menu_button_toggled(button_pressed, v):
	settings_button.set_pressed_no_signal(false)
	return
	match v:
		0:
			if button_pressed:
				settings_button.set_pressed_no_signal(false)
				#playground_button.set_pressed_no_signal(false)
				
		#1:
		#	if button_pressed:
		#		dashboard_button.set_pressed_no_signal(false)
		#		settings_button.set_pressed_no_signal(false)
		1:
			if button_pressed:
				dashboard_button.set_pressed_no_signal(false)
				#playground_button.set_pressed_no_signal(false)
				
	left_menu_button_pressed.emit(v)


func _on_close_button_pressed():
	var shutter_tween : Tween = create_tween()
	shutter_tween.parallel().tween_property( $MarginContainer, "scale", Vector2(1.0,0.0), 0.5 )
	shutter_tween.parallel().tween_property( self, "size/y", 0.0, 0.5 )
