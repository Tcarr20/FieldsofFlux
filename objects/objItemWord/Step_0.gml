/// @description Insert description here
// You can write your code in this editor
life++;
if (life > 45 && (life mod 10 == 0)) {visible = false;}
else {visible = true;}
if (life > 80) { instance_destroy(); }