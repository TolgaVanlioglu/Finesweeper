//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
	gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
//	float val = (gl_FragColor.r+gl_FragColor.g+gl_FragColor.b);
	float sure =  0.21*gl_FragColor.r + 0.72*gl_FragColor.g + 0.07*gl_FragColor.b;
	gl_FragColor.rgb = vec3(sure, sure, sure);
//	gl_FragColor.rgb = vec3(val, val, val);
}