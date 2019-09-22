/// @description Initialize
vx = 0;
vy = 0;
cx = 0;
cy = 0;
abil = Powers.None;
wait = 40;

/// Friction & Acceleration
move_fric = 0.2;
on_ground = false;
fall_grav = 0.3;
life = 0;


/// DEBUG
vx = irandom_range(-8, 8);
vy = irandom_range(-1, 3);