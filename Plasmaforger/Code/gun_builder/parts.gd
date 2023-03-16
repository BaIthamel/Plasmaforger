extends VBoxContainer


signal part_sold(amount: float)


func _can_drop_data(_at_position: Vector2, data) -> bool:
	return data is Dictionary and data.has_all(["part", "offset"]) and data.part is GunPartSprite


func _drop_data(at_position: Vector2, data) -> void:
	if not data.part.get_parent() == self:
		emit_signal("parts_changed", data.part.data.IPRICE)
		data.part.get_parent().remove_child(data.part)
		add_child(data.part)
	for other_child in get_children():
		if other_child == data.part:
			continue
		if other_child.get_rect().end.y > at_position.y:
			move_child(data.part, other_child.get_index())
			return
	move_child(data.part, -1)