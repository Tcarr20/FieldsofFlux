global.p_start_x[0] = 96;	global.p_start_y[0] = 352;
global.p_start_x[1] = 1440; global.p_start_y[1] = 352;
global.p_start_x[2] = 96;	global.p_start_y[2] = 768;
global.p_start_x[3] = 1440; global.p_start_y[3] = 768;
if (!audio_is_playing(sndMenu)) 
{ 
	audio_play_sound(sndMenu,1,1); 
	audio_sound_gain(sndMenu,1,0);
	audio_sound_set_track_position(sndMenu, 0);
}