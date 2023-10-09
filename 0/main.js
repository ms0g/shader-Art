import * as THREE from 'https://cdn.skypack.dev/three@0.136';


class ShaderArt {
  constructor() {
  }

  async initialize() {
    this.renderer_ = new THREE.WebGLRenderer();
    document.body.appendChild(this.renderer_.domElement);

    window.addEventListener('resize', () => {
      this.onWindowResize_();
    }, false);

    this.scene_ = new THREE.Scene();

    this.camera_ = new THREE.OrthographicCamera(0, 1, 1, 0, 0.1, 1000);
    this.camera_.position.set(0, 0, 1);
    
    this.clock_ = new THREE.Clock();

    await this.setup();
    
    this.onWindowResize_();
    this.animate();
  }

  async setup() {
    const vs = await fetch('./shaders/main.vert.glsl');
    const fs = await fetch('./shaders/main.frag.glsl');

    const material = new THREE.ShaderMaterial({
      uniforms: {
        resolution: {
          value: new THREE.Vector2(
            window.innerWidth, window.innerHeight
        )},
        aspectRatio: {
          value: window.innerWidth / window.innerHeight
        },
        time: { value: 0.0 }
      },
      vertexShader: await vs.text(),
      fragmentShader: await fs.text()
    });

    this.material_ = material;

    const geometry = new THREE.PlaneGeometry(1, 1);
    const plane = new THREE.Mesh(geometry, material);
    plane.position.set(0.5, 0.5, 0);
    this.scene_.add(plane);

    this.clock_.start();
  }

  onWindowResize_() {
    this.renderer_.setSize(window.innerWidth, window.innerHeight);
    this.material_.uniforms.resolution.value = new THREE.Vector2(
        window.innerWidth, window.innerHeight);
  }

  animate() {
    requestAnimationFrame((t) => {
      this.renderer_.render(this.scene_, this.camera_);
      this.animate();
    });
    //console.log(dt);
    this.material_.uniforms.time.value = this.clock_.getElapsedTime();
  }
}


let APP_ = null;

window.addEventListener('DOMContentLoaded', async () => {
  APP_ = new ShaderArt();
  await APP_.initialize();
});
