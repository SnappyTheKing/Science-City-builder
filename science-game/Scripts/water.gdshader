shader_type spatial;

render_mode specular_toon;

uniform sampler2D noise;
uniform sampler2D normalmap;
uniform float height_scale = 0.1;

varying vec2 pos;

float wave(vec2 position){
	position += texture(noise, position).x * 2.0 - 1.0;
	vec2 wv = 1.0 - abs(sin(position * 15.0));
	return pow(1.0 - pow(wv.x * wv.y, 0.65), 3.0);
}

float height(vec2 position, float time) {
	float d = wave(position * 0.3 + time * 0.015) * 0.3;
	d += wave(position * 0.65 + time * 0.005) * 0.1;
	
	return d;
}

void vertex() {
	pos = VERTEX.xz;
	float k = height(pos, TIME);
	VERTEX.y += k * height_scale;
	NORMAL = normalize(vec3(k - height(pos + vec2(0.1, 0.0), TIME), 0.1, k - height(pos + vec2(0.0, 0.1), TIME)));
}

void fragment() {
	float fresnel = sqrt(1.0 - dot(NORMAL, VIEW));
	RIM = 0.2;
	METALLIC = 0.0;
	ROUGHNESS = 0.01 * (1.0 - fresnel);
	ALBEDO = vec3(0.01, 0.03, 0.1) + (0.1 * fresnel);

	
	//NORMAL_MAP = texture(normalmap, pos).xyz;
}