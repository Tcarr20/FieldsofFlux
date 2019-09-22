///AudioPlaySoundOnce
if(!audio_is_playing(argument0))
{
		audio_play_sound(argument0,1,0);
		audio_sound_gain(argument0, 0.45, 0);
}