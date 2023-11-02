
varying vec2 vUv;

uniform vec2 resolution;
uniform float aspectRatio;
uniform float time;

vec3 red = vec3(0.8627, 0.1451, 0.1255);
vec3 yellow = vec3(0.9333, 0.8588, 0.3961);
vec3 blue = vec3(0.0157, 0.3647, 0.6235);


void main() {
  vec3 color = vec3(0.0);
  vec2 uv = vUv;
  uv.x *= aspectRatio;

  // horizontal
  vec2 h0 = step(vec2(0.01*1.7*1.3), abs(uv-0.15));
  if (uv.x < 0.9) {
    h0 = vec2(1.0);
  }

  vec2 h1 = step(vec2(0.01*1.7), abs(uv-0.3));
  vec2 h2 = step(vec2(0.01*1.7*2.0), abs(uv-0.7));
  if (uv.x > 0.22) {
    h2 = vec2(1.0);
  }
  
  float pct = h0.y * h1.y * h2.y;

  // vertical
  vec2 v1 = step(vec2(0.01*1.7), abs(uv-0.22));
  vec2 v2 = step(vec2(0.01*1.7), abs(uv-0.9));
  if (uv.y > 0.3) {
    v2 = vec2(1.0);
  }
  
  pct *= v1.x * v2.x;
  
  color = vec3(pct);
    
  // filling
  if (uv.x > 0.22 && uv.y > 0.3 ) {
    color *= red;
  }

  if (uv.x < 0.22 && uv.y < 0.3) {
    color *= blue;
  }

  if (uv.x > 0.9 && uv.y < 0.15) {
    color *= yellow;
  }

  gl_FragColor = vec4(color, 1.0);
}
