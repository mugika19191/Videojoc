shader_type spatial;
uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear_mipmap;
void fragment() {
	// Place fragment code here.
	float x = float(int (FRAGCOORD.x) % 3);
	float y = float(int (FRAGCOORD.y) % 3);
	x = FRAGCOORD.x + floor (float(2) / 2.0) - x;
	y= FRAGCOORD.y + floor(float (2) / 2.0) - y;
// set albedo value on the current coordinate based on vec2(x,y) / viewport_size
ALBEDO = texture (SCREEN_TEXTURE, vec2 (x, y) / VIEWPORT_SIZE).xyz;
}
