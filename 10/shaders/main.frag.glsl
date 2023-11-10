
varying vec2 vUv;

uniform vec2 resolution;
uniform float aspectRatio;
uniform float time;

float random (in float x) {
    return fract(sin(x)*1e4);
}

float random (in vec2 uv) {
    return fract(sin(dot(uv.xy, vec2(12.9898,78.233)))* 43758.5453123);
}

float randomSerie(float x, float freq, float t) {
    return step(.6,random( floor(x*freq)-floor(t) ));
}

void main() {
    vec2 uv = vUv;
    uv.x *= aspectRatio;

    vec3 color = vec3(0.0);

    float cols = 2.0;
    float freq = random(floor(time))+abs(atan(time)*0.1);
    float t = 60.+time*(1.0-freq)*30.;

    if (fract(uv.x*cols* 0.5) < 0.5){
        t *= -1.0;
    }

    freq += random(floor(uv.x));

    float offset = 0.025;
    color = vec3(randomSerie(uv.x, freq*100., t+offset),
                 randomSerie(uv.x, freq*100., t),
                 randomSerie(uv.x, freq*100., t-offset));
  
  gl_FragColor = vec4(color, 1.0);
}
