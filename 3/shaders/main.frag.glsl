
varying vec2 vUv;
uniform float time;

vec3 palette(float t) {
  vec3 a = vec3(0.5, 0.5, 0.5);
  vec3 b = vec3(0.5, 0.5, 0.5);
  vec3 c = vec3(1.0, 1.0, 1.0);
  vec3 d = vec3(0.263, 0.416, 0.557);

  return a + b * cos(6.28 * (c * t + d));
}

float random (vec2 st) {
    return fract(sin(dot(st.xy, vec2(12.9898,78.233))) * 43758.5453123);
}

void main() {
  vec3 colour = vec3(0.0);
  vec2 uv = vUv;

  float seed = random(uv + time);

  vec3 c = palette(seed);

  colour += c;

  gl_FragColor = vec4(colour, 1.0);
}
