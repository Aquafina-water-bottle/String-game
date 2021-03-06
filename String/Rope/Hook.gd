extends Node2D

const pin = preload("res://Rope/Pin/Pin.tscn")
const link = preload("res://Rope/Link/Link.tscn")
const box = preload("res://Rope/Box.tscn")


func _ready():
    var parent = $Anchor
    for i in range (20):
        var child = addPin(parent)
        addLink(parent, child)
        parent = child
    var child = addBox(parent)
    addLink(parent, child)

func addBox(parent):
    var p = box.instance()
    p.position = parent.position
    p.position.y += 20
    add_child(p)
    return p

func addPin(parent):
    var p = pin.instance()
    p.position = parent.position
    p.position.y += 10
    add_child(p)
    return p

func addLink(parent, child):
    var p = link.instance()
    p.node_a = parent.get_path()
    p.node_b = child.get_path()
    parent.add_child(p)