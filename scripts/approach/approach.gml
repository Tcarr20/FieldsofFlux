/// @description Approach the value by the given increment
/// @param start
/// @param end
/// @param amount
var s = argument[0], e = argument[1], a = 1;
if (argument_count == 3) { a = argument[2]; } else { a = max(abs(s-e)/2, 0.05); }
if (s < e)
	return min(s + a, e);
else
	return max(s - a, e);