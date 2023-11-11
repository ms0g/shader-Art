
varying vec2 vUv;
uniform float time;
uniform sampler2D diffuse1;


void main() {
  vec3 colour = texture2D(diffuse1, vUv).xyz;

  colour = pow(colour, vec3(3.0/4.0, 7.0/6.0, 7.0/6.0));

  gl_FragColor = vec4(colour, 1.0);
}
