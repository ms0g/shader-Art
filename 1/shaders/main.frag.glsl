varying vec2 vUvs;

uniform sampler2D texture1;
uniform float time;

float inverseLerp(float minValue, float maxValue, float v) {
  return (v - minValue) / (maxValue - minValue);
}

float remap(float inMin, float inMax, float outMin, float outMax, float v) {
  float t = inverseLerp(inMin, inMax, v);
  return mix(outMin, outMax, t);
}

void main() {
  vec3 colour = vec3(0.0);

  float t1 = remap(-1.0, 1.0, 0.9, 1.0, sin(vUvs.y * 400.0 + time * 10.0));
  float t2 = remap(-1.0, 1.0, 0.9, 1.0, sin(vUvs.y * 50.0 - time * 2.0));

  colour = texture2D(texture1, vUvs).xyz * t1 * t2;

  gl_FragColor = vec4(colour, 1.0);
}
