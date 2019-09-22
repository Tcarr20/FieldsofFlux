/// @description Insert description here
// You can write your code in this editor
// Draws Lamp and then wall to the bloom surfaces
surface_reset_target()
surface_set_target(bloom);
d3d_set_projection_ortho(0,0,room_width,room_height,0);
draw_set_color(c_black);
draw_set_alpha(0.5);
draw_rectangle(0,0,room_width,room_height,0); // Clear the surface to clear the "trails" effect
draw_set_alpha(1);

/// Projectile bloom
if (instance_exists(objCannonball))
{
	with(objCannonball) { draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, col, image_alpha); }
}
if (instance_exists(objItemUI))
{
	with(objItemUI) { draw_self(); }
}

/// Player Bloom
if(instance_exists(objPlayer)) 
{
	for(var i=0; i<instance_number(objPlayer); i++)
	{
		var p = instance_find(objPlayer, i);
		with (p)
		{
			/// Draw order
			if (!p.bloom) {break;}
			/// Draw order
			var d_sprite, d_color = c_p1, squish_off = -(squish*sprite_height/2) + (sprite_height/2);
			// Pick color
			if (p_num == 0) {d_color = c_p1;}
			if (p_num == 1) {d_color = c_p2;}
			if (p_num == 2) {d_color = c_p3;}
			if (p_num == 3) {d_color = c_p4;}

			// Draw Left Arm
			if (powers[0]==Powers.Grab || powers[1]==Powers.Grab || powers[2]==Powers.Grab)
			{
				if (attack = Powers.Grab)
				{
					d_sprite = sprNULL;
					if(myHand != noone) { draw_line_width_color(x, y + squish_off, myHand.x, myHand.y + squish_off, 6, d_color, d_color); }
				}
				else
				{
						 if (sprite == "Idle") { d_sprite = sprPlayerLArmIdleGrab; }
					else if (sprite == "Move") { d_sprite = sprPlayerLArmMoveGrab; }
					else if (sprite == "Jump") { d_sprite = sprPlayerLArmJumpGrab; }
					else if (sprite == "Fall") { d_sprite = sprPlayerLArmFallGrab; }
					else if (sprite == "Skid") { d_sprite = sprPlayerLArmSkidGrab; }
				}
			}
			else
			{
					 if (sprite == "Idle") { d_sprite = sprPlayerLArmIdleNorm; }
				else if (sprite == "Move") { d_sprite = sprPlayerLArmMoveNorm; }
				else if (sprite == "Jump") { d_sprite = sprPlayerLArmJumpNorm; }
				else if (sprite == "Fall") { d_sprite = sprPlayerLArmFallNorm; }
				else if (sprite == "Skid") { d_sprite = sprPlayerLArmSkidNorm; }
			}
			draw_sprite_ext(d_sprite, image_index, x, y + squish_off, face*stretch, squish, image_angle, d_color, image_alpha);

			// Draw Pom
			if (powers[0]==Powers.Dash || powers[1]==Powers.Dash || powers[2]==Powers.Dash)
			{
				if (attack == Powers.Dash) { d_sprite = sprPlayerTopAttackPom; }
				else
				{
						 if (sprite == "Idle") { d_sprite = sprPlayerTopIdlePom; }
					else if (sprite == "Move") { d_sprite = sprPlayerTopMovePom; }
					else if (sprite == "Jump") { d_sprite = sprPlayerTopJumpPom; }
					else if (sprite == "Fall") { d_sprite = sprPlayerTopFallPom; }
					else if (sprite == "Skid") { d_sprite = sprPlayerTopSkidPom; }
				}
				draw_sprite_ext(d_sprite, image_index, x, y + squish_off, face*stretch, squish, image_angle, d_color, image_alpha);
			}

			// Draw Chest
			if (powers[0]==Powers.Bubble || powers[1]==Powers.Bubble || powers[2]==Powers.Bubble)
			{
				if (puffed)
				{
						 if (sprite == "Idle") { d_sprite = sprPlayerChestIdleBubble; }
					else if (sprite == "Move") { d_sprite = sprPlayerChestMoveBubble; }
					else if (sprite == "Jump") { d_sprite = sprPlayerChestJumpBubble; }
					else if (sprite == "Fall") { d_sprite = sprPlayerChestFallBubble; }
					else if (sprite == "Skid") { d_sprite = sprPlayerChestSkidBubble; }
				}
				else
				{
						 if (sprite == "Idle") { d_sprite = sprPlayerChestIdleNorm; }
					else if (sprite == "Move") { d_sprite = sprPlayerChestMoveNorm; }
					else if (sprite == "Jump") { d_sprite = sprPlayerChestJumpNorm; }
					else if (sprite == "Fall") { d_sprite = sprPlayerChestFallNorm; }
					else if (sprite == "Skid") { d_sprite = sprPlayerChestSkidNorm; }
				}
	
			}
			else
			{
					 if (sprite == "Idle") { d_sprite = sprPlayerChestIdleNorm; }
				else if (sprite == "Move") { d_sprite = sprPlayerChestMoveNorm; }
				else if (sprite == "Jump") { d_sprite = sprPlayerChestJumpNorm; }
				else if (sprite == "Fall") { d_sprite = sprPlayerChestFallNorm; }
				else if (sprite == "Skid") { d_sprite = sprPlayerChestSkidNorm; }
			}
			draw_sprite_ext(d_sprite, image_index, x, y + squish_off, face*stretch, squish, image_angle, d_color, image_alpha);

			// Draw Helm
				 if (sprite == "Idle") { sprite_index = sprPlayerHelmIdle; }
			else if (sprite == "Move") { sprite_index = sprPlayerHelmMove; }
			else if (sprite == "Jump") { sprite_index = sprPlayerHelmJump; }
			else if (sprite == "Fall") { sprite_index = sprPlayerHelmFall; }
			else if (sprite == "Skid") { sprite_index = sprPlayerHelmSkid; }
			draw_sprite_ext(sprite_index, image_index, x, y + squish_off, face*stretch, squish, image_angle, d_color, image_alpha);

			// Draw Face
			if (powers[0]==Powers.Pound || powers[1]==Powers.Pound || powers[2]==Powers.Pound)
			{
					 if (sprite == "Idle") { d_sprite = sprPlayerFaceIdlePound; }
				else if (sprite == "Move") { d_sprite = sprPlayerFaceMovePound; }
				else if (sprite == "Jump") { d_sprite = sprPlayerFaceJumpPound; }
				else if (sprite == "Fall") { d_sprite = sprPlayerFaceFallPound; }
				else if (sprite == "Skid") { d_sprite = sprPlayerFaceSkidPound; }
			}
			else
			{
					 if (sprite == "Idle") { d_sprite = sprPlayerFaceIdleNorm; }
				else if (sprite == "Move") { d_sprite = sprPlayerFaceMoveNorm; }
				else if (sprite == "Jump") { d_sprite = sprPlayerFaceJumpNorm; }
				else if (sprite == "Fall") { d_sprite = sprPlayerFaceFallNorm; }
				else if (sprite == "Skid") { d_sprite = sprPlayerFaceSkidNorm; }
			}
			draw_sprite_ext(d_sprite, image_index, x, y + squish_off, face*stretch, squish, image_angle, d_color, image_alpha);

			// Draw Legs
			if (powers[0]==Powers.Rocket || powers[1]==Powers.Rocket || powers[2]==Powers.Rocket)
			{
				if (attack = Powers.Rocket) { d_sprite = sprPlayerLegsAttackRocket; }
				else
				{
						 if (sprite == "Idle") { d_sprite = sprPlayerLegsIdleRocket; }
					else if (sprite == "Move") { d_sprite = sprPlayerLegsMoveRocket; }
					else if (sprite == "Jump") { d_sprite = sprPlayerLegsJumpRocket; }
					else if (sprite == "Fall") { d_sprite = sprPlayerLegsFallRocket; }
					else if (sprite == "Skid") { d_sprite = sprPlayerLegsSkidRocket; }
				}
			}
			else
			{
					 if (sprite == "Idle") { d_sprite = sprPlayerLegsIdleNorm; }
				else if (sprite == "Move") { d_sprite = sprPlayerLegsMoveNorm; }
				else if (sprite == "Jump") { d_sprite = sprPlayerLegsJumpNorm; }
				else if (sprite == "Fall") { d_sprite = sprPlayerLegsFallNorm; }
				else if (sprite == "Skid") { d_sprite = sprPlayerLegsSkidNorm; }
			}
			draw_sprite_ext(d_sprite, image_index, x, y + squish_off, face*stretch, squish, image_angle, d_color, image_alpha);

			// Draw Right Arm
			if (powers[0]==Powers.Cannon || powers[1]==Powers.Cannon || powers[2]==Powers.Cannon)
			{
				if (attack = Powers.Cannon) { d_sprite = sprPlayerRArmAttackCannon; }
				else
				{
						 if (sprite == "Idle") { d_sprite = sprPlayerRArmIdleCannon; }
					else if (sprite == "Move") { d_sprite = sprPlayerRArmMoveCannon; }
					else if (sprite == "Jump") { d_sprite = sprPlayerRArmJumpCannon; }
					else if (sprite == "Fall") { d_sprite = sprPlayerRArmFallCannon; }
					else if (sprite == "Skid") { d_sprite = sprPlayerRArmSkidCannon; }
				}
			}
			else
			{
					 if (sprite == "Idle") { d_sprite = sprPlayerRArmIdleNorm; }
				else if (sprite == "Move") { d_sprite = sprPlayerRArmMoveNorm; }
				else if (sprite == "Jump") { d_sprite = sprPlayerRArmJumpNorm; }
				else if (sprite == "Fall") { d_sprite = sprPlayerRArmFallNorm; }
				else if (sprite == "Skid") { d_sprite = sprPlayerRArmSkidNorm; }
			}
			draw_sprite_ext(d_sprite, image_index, x, y + squish_off, face*stretch, squish, image_angle, d_color, image_alpha);
		}
	}
}



surface_reset_target()
surface_set_target(bloom2);
draw_surface_ext(bloom,0,0,.5,.5,0,c_white,1);
surface_reset_target()
surface_set_target(bloom3);
draw_surface_ext(bloom2,0,0,0.5,0.5,0,c_white,1);
surface_reset_target()
surface_set_target(bloom4);
draw_surface_ext(bloom3,0,0,.5,.5,0,c_white,1);
surface_reset_target()
surface_set_target(bloom4);
draw_surface_ext(bloom5,0,0,1,1,0,c_white,.1);
surface_reset_target()






