//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
	gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
//	float val = (gl_FragColor.r+gl_FragColor.g+gl_FragColor.b);
	float rr = gl_FragColor.r;
	float gg = gl_FragColor.g;
	float bb = gl_FragColor.b;
	gl_FragColor.rgb = vec3(float(1)-rr, gg, float(1)-bb);
//	gl_FragColor.rgb = vec3(val, val, val);
}