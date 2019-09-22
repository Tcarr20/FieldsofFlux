/// @description Initialize
/// Sub pixel movment
vx = 0;
vy = 0;
cx = 0;
cy = 0;

/// Friction & Acceleration
move_acc = 0.4;
move_fric = 0.3;
move_speed = 3.4;
on_ground = false;
fall_grav = 0.5;
fall_speed = 12;
jump_acc = 3.4;
jump_speed = 8.2;
slide_speed = 1.5;

/// Sprite & Animation
sprite = "Idle";
anim_norm = 1;
image_speed = anim_norm;
bloom = false;

/// State flags
jumping = false;
skidding = false;
sticking = false;
hitstun = 0;
stun_time = 60;
hitstop = 0;
stop_time = 15;
face = 1;
squish = 1;
squish_time = 0;
stretch = 1;
stretch_time = 0;
attack = Powers.None;
attack_time = 0;
puffed = false;
spin_time = 0;

stalling = false;
myHand = noone;
retract = false;
GrabSpeed =20;
GrabDist = 375;

clash = noone;

/// State
p_num = 0;
powers[0] = Powers.Cannon;
powers[1] = Powers.None;
powers[2] = Powers.None;
power_add = Powers.None;
x_cool = 0;
y_cool = 0;
b_cool = 0;

/// Particles
player_part = part_system_create_layer("Effect", true);
part_smoke = part_type_create();
part_type_sprite(part_smoke, sprSmoke, true, true, true);
part_type_size(part_smoke, 0.9, 1.5, -0.05, 0);
part_type_alpha3(part_smoke, 1, 0.7, 0.4);
part_type_speed(part_smoke, 1.5, 2.5, -0.1, 0);
part_type_direction(part_smoke, 70, 110, 0, 0);
part_type_orientation(part_smoke, 0, 180, 5, 0, true);
part_type_blend(part_smoke, false)
part_type_life(part_smoke, 20, 30);
part_goop = part_type_create();
part_type_sprite(part_goop, sprGoop, false, true, true);
part_type_size(part_goop, 0.8, 1.2, 0, 0.1);
part_type_speed(part_goop, 1.5, 3, 0.08, 0);
part_type_direction(part_goop, 225, 315, 0, 0);
part_type_blend(part_goop, false)
part_type_life(part_goop, 10, 18);
part_shoot = part_type_create();
part_type_sprite(part_shoot, sprGoop, false, true, true);
part_type_size(part_shoot, 0.7, 1.4, 0.05, 0.2);
part_type_speed(part_shoot, 1.8, 3.1, 0.1, 0);
part_type_direction(part_shoot, 0, 360, 3, 1);
part_type_blend(part_shoot, false)
part_type_life(part_shoot, 12, 20);
goop_shooter = part_emitter_create(player_part);

//UI
myUi = instance_create_layer(0, 0, "Control", objUi);
myUi.myPlayer= self;
UiCordx = myUi.x;
UiCordy = myUi.y;

//Sound
usedPowerSnd[0] = false;
usedPowerSnd[1] = false;
usedPowerSnd[2] = false;

//control
start = false;
