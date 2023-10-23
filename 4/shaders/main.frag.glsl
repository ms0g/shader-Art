
varying vec2 vUv;
uniform float time;
uniform sampler2D diffuse1;


void main() {
  vec3 colour = texture2D(diffuse1, vUv).xyz;

  // Tinting
  vec3 tintColour = vec3(0.78, 1.0, 0.78);
  colour *= tintColour;

  gl_FragColor = vec4(colour, 1.0);
}
