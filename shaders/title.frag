// Automatically converted with https://github.com/TheLeerName/ShadertoyToFlixel

#pragma header

#define iResolution vec3(openfl_TextureSize, 0.)
uniform float iTime;

// end of ShadertoyToFlixel header


uniform vec3 color1;
uniform vec3 color2;

uniform vec3 color3;
uniform vec3 color4;

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    float aspect = iResolution.y/iResolution.x;    
	vec2 uv = fragCoord.xy / iResolution.x;
    

    uv -= vec2(0.5, 0.5 * aspect);
    
    float rot = radians(45.0 * (iTime / 8.0)); // radians(45.0*sin(iTime));
    
    mat2 m = mat2(cos(rot), -sin(rot), sin(rot), cos(rot));
   	uv  = m * uv;
    uv += vec2(0.5, 0.5 * aspect);
    uv.y += 0.5*(1.0 - aspect);
    
    vec2 pos = (10.0*uv) + sin(iTime * 0.25) * 4.0;
    vec2 rep = fract(pos);
    
    float dist = 2.0*min(min(rep.x, 1.0-rep.x), min(rep.y, 1.0-rep.y));
    float squareDist = length((floor(pos)+vec2(0.5)) - vec2(5.0) );
    
    float edge = sin(iTime-squareDist*0.5)*0.5+0.5;
    
    float value;
    
    edge = (iTime-squareDist*0.5)*0.5;
    edge = 2.0*fract(edge*0.5);

    //value = 2.0*abs(dist-0.5);
    //value = pow(dist, 2.0);

    value = fract (dist*2.0);
    value = mix(value, 1.0-value, step(1.0, edge));

    //value *= 1.0-0.5*edge;

    edge = pow(abs(1.0-edge), 2.0);
    
    //edge = abs(1.0-edge);
    value = smoothstep( edge-0.05, edge, 0.95*value);
    
    
    value += squareDist*.1;
    
    vec3 type1 = mix(color1, color2, value);
    vec3 type2 = mix(color3, color4, value);
    
    fragColor.rgb = mix(type1, type2, sin(iTime * 0.25));
    fragColor.a = 0.25*clamp(value, 0.0, 1.0);
}

void main() {
	mainImage(gl_FragColor, openfl_TextureCoordv*openfl_TextureSize);
}