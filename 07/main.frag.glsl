
varying vec2 vUv;

uniform vec2 resolution;
uniform float aspectRatio;
uniform float time;

float random (vec2 uv) {
    return fract(sin(dot(uv.xy,
                         vec2(12.9898,78.233)))*
        43758.5453123);
}


void main() {
  vec2 uv = vUv;
  uv *= 10.0; // Scale the coordinate system by 10
  vec2 ipos = floor(uv);  // get the integer coords

  // Assign a random value based on the integer coord
  vec3 color = vec3(random(ipos));
  
  gl_FragColor = vec4(color, 1.0);
}
