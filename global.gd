extends Node

var cur_scene = null 

func _ready():
	var root = get_tree().get_root()
	root.add_child(self)
	cur_scene = root.get_child(root.get_child_count() - 1)
	pass

func _goto_scene(path):
	call_deferred("_deferred_goto_scene", path)
	
func _deferred_goto_scene(path):
	cur_scene.free()
	var s = ResourceLoader.load(path)
	cur_scene = s.instance()
	get_tree().get_root().add_child(cur_scene)
	get_tree().set_current_scene(cur_scene)