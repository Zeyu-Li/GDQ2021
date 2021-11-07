extends Node2D

var speed = 800
export(bool) var hurtsPlayer = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move(delta)

func move(delta):
	var velocity = Vector2(1, 0).rotated(rotation) * speed
	global_position += velocity * delta



func _on_Lifetime_timeout():
	explode()

func explode():
	queue_free()


func _on_Area2D_body_entered(body):
	if body.is_in_group("Player"):
		body.takeDamage()
		explode()

func explode():
	pass
