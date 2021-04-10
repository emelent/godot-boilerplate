extends KinematicBody2D
class_name Actor



export(float) var speed = 100

onready var graphics = $Graphics
onready var facing_right_scale = Vector2(graphics.scale.x, graphics.scale.y)
onready var facing_left_scale = Vector2(-graphics.scale.x, graphics.scale.y)


var motion = Vector2.ZERO setget set_motion

func _physics_process(delta):
    move_and_collide(motion * speed * delta)

func is_moving():
    return motion.length() != 0

func set_motion(v):
    var x = motion.x
    motion = v
    if v.x > 0:
        graphics.scale = facing_right_scale
    elif v.x < 0:
        graphics.scale = facing_left_scale 
     
