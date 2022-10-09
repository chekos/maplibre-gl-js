uniform sampler2D u_texture;
uniform highp sampler2D u_depth;
uniform vec4 u_fog_color;
uniform float u_fog_blend;

varying vec2 v_texture_pos;
varying float v_depth;

void main() {
    vec4 color = texture2D(u_texture, v_texture_pos);
    if (v_depth > u_fog_blend) {
        gl_FragColor = mix(color, u_fog_color, (v_depth - u_fog_blend) / (1.0 - u_fog_blend));
    } else {
        gl_FragColor = color;
    }
}
