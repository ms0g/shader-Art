
varying vec2 vUv;

uniform vec2 resolution;
uniform float aspectRatio;
uniform float time;

const float PI = 3.14;

vec3 palette(float t) {
  vec3 a = vec3(0.5, 0.5, 0.5);
  vec3 b = vec3(0.5, 0.5, 0.5);
  vec3 c = vec3(1.0, 1.0, 1.0);
  vec3 d = vec3(0.263, 0.416, 0.557);

  return a + b * cos(6.28 * (c * t + d));
}

vec2 rotate(float angle, vec2 uv) {
  angle *= PI / 180.0;
  return mat2(
    cos(angle), -sin(angle), 
    sin(angle), cos(angle)) * uv;
}

void main() {
  vec2 uv = rotate(time * 60.0, vUv);
  
  vec3 c1 = palette(distance(uv, vec2(0.7)));
  vec3 c2 = palette(distance(vUv, vec2(0.5 + sin(time)*2.0)));

  
  vec3 color = c1 * c2 * 5.0;
  gl_FragColor = vec4(color, 1.0);
}
