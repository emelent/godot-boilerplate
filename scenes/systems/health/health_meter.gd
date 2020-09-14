extends Node2D
#class_name HealthMeter

export(NodePath) var health_path
export(Color) var background_color = Color.black
export(Color) var meter_color = Color.white
export(float) var height = 10
export(float) var width = 100
export(Vector2) var padding = Vector2(2, 2)

onready var health: HealthSystem = get_node_or_null(health_path)


func _ready():
    # connect health system signals
    health.connect("damaged", self, "__on_damaged")
    health.connect("healed", self, "__on_healed")
    health.connect("hp_changed", self, "__on_changed")
    pass


func _draw():
    if health == null: return

    var pos = position
    pos.x -= width / 2
    # draw background
    draw_rect(Rect2(pos, Vector2(width, height)), background_color)

    # draw hp meter
    var max_width = width - (padding.x * 2)
    var hp_height = height - (padding.y * 2)
    var hp_width = (health.hp / health.max_hp) * max_width
    var meter_pos = pos + padding
    draw_rect(Rect2(meter_pos, Vector2(hp_width, hp_height)), meter_color)

func  _process(delta):
    pass

func __on_damaged(pts):
    pass


func __on_healed(pts):
    pass


func __on_changed(pts):
    update()
    pass
