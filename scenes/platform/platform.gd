extends VBoxContainer

@onready var StatsText = $Margin/ContentPanel/Margin/Content/StatsText

func _ready() -> void:
	var new_text : String = StatsText.text
	new_text = new_text.replace("{id}", Bridge.platform.id)
	new_text = new_text.replace("{lang}", Bridge.platform.language)
	new_text = new_text.replace("{payload}", str(Bridge.platform.payload))
	new_text = new_text.replace("{tld}", str(Bridge.platform.tld))
	new_text = new_text.replace("{audio}", str(Bridge.platform.is_audio_enabled))

	Bridge.platform.connect("audio_state_changed", Callable(self, "_on_audio_state_changed"))

	StatsText.text = new_text


func _on_audio_state_changed(is_enabled: bool) -> void:
	var new_text : String = StatsText.text
	new_text = new_text.replace("{audio}", str(is_enabled))
