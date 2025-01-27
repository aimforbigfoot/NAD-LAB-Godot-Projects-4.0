shader_type canvas_item;

uniform float amplitude : hint_range(0.0, 10.0) = 5.0; // Strength of the jiggle
uniform float frequency : hint_range(0.0, 10.0) = 2.0; // Speed of the jiggle

void fragment() {
    vec2 offset = vec2(
        sin(FRAGCOORD.x * frequency + TIME) * amplitude,
        cos(FRAGCOORD.y * frequency + TIME) * amplitude
    ) / SCREEN_PIXEL_SIZE;
    COLOR = texture(TEXTURE, UV + offset);
}
