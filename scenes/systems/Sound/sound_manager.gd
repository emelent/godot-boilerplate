extends Node2D
class_name SoundManager

onready var SfxNodeContainer = $Playing/SFX
onready var BgmNodeContainer = $Playing/BGM
var sfx = {}
var bgm = {}


var bgm_streams = []
var sfx_streams = []

# OVERRIDE
func _ready():
	print("okay")
	for sound in $BGM.get_children():
		print("Loading BGM %s" % sound.name)
		bgm[sound.name] = sound

	for sound in $FX.get_children():
		print("Loading SFX %s" % sound.name)
		sfx[sound.name] = sound


# INTERNAL METHODS

func __play(sound):
	if sound:
		print("playing '%s'" % sound.name)
		sound.play()

func __pause(sound):
	if sound and sound.playing:
		print("pausing '%s'" % sound.name)
		sound.stream_paused = true

func __unpause(sound):
	if sound and sound.stream_paused:
		print("unpausing '%s'" % sound.name)
		sound.stream_paused = false

func __stop(sound):
	if sound:
		print("stopping '%s'" % sound.name)
		sound.stop()

func __on_sfx_finished(sound):
	print("sfx '%s' finished" % sound.name)
	sfx_streams.erase(sound)

func __on_bgm_finished(sound):
	print("bgm '%s' finished" % sound.name)
	bgm_streams.erase(sound)

# PUBLIC METHODS

func playSFX(name):
	# instance sound
	var sound = sfx[name].duplicate()
	SfxNodeContainer.add_child(sound)


	# connect finished signal
	sound.connect("finished", self, "__on_sfx_finished", [sound])
	sfx_streams.append(sound)

	# play sound
	__play(sound)


func playBGM(name):
	# instance sound
	var sound = bgm[name].duplicate()
	BgmNodeContainer.add_child(sound)

	# connect finished signal
	sound.connect("finished", self, "__on_bgm_finished", [sound])
	bgm_streams.append(sound)

	# play sound
	__play(sound)



func pauseSFX():
	for sound in sfx_streams:
		__pause(sound)

func pauseBGM():
	for sound in bgm_streams:
		__pause(sound)

func unpauseSFX():
	for sound in sfx_streams:
		__unpause(sound)

func unpauseBGM():
	for sound in bgm_streams:
		__unpause(sound)

func stopSFX():
	while sfx_streams.size() > 0:
		__stop(sfx_streams[0])
		sfx_streams.remove(0)

	for child in SfxNodeContainer.get_children():
		SfxNodeContainer.remove_child(child)
	print(sfx_streams)

func stopBGM():
	while bgm_streams.size() > 0:
		__stop(bgm_streams[0])
		bgm_streams.remove(0)

	for child in BgmNodeContainer.get_children():
		BgmNodeContainer.remove_child(child)

	print(bgm_streams)
