#version 330 core
out vec4 fragColor;

//uniform float uTime;
in vec4 vertexColor;

void main() {
  //float intensity = sin(uTime);
  //vec3 color = vec3(intensity, intensity / 4, 1.0 - intensity);
  fragColor = vec4(vertexColor);
}
