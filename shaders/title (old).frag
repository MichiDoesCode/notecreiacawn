// Automatically converted with https://github.com/TheLeerName/ShadertoyToFlixel

#pragma header

#define iResolution vec3(openfl_TextureSize, 0.)
uniform float iTime;
uniform float triangleCount;
#define iChannel0 bitmap
#define texture flixel_texture2D

// end of ShadertoyToFlixel header

float tri(vec2 st, float pct){
    return 1.0 - smoothstep( pct, pct+0.05, st.y);
}

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    // Normalized pixel coordinates (from 0 to 1)
    vec2 uv = fragCoord/iResolution.xy;
    uv.x *= iResolution.x/iResolution.y;

    // Time varying pixel color
    vec3 color_a = vec3((0.145 * uv.x), 0.267, (0.757 * uv.y));
    vec3 color_b = vec3(0.882,0.239,0.239);
    vec3 color_c = vec3(0.024,0.996,0.137);
    uv *= triangleCount;
    uv.x += iTime;
    float y1 = mod(uv.x,1.0) + sin(uv.x / triangleCount + iTime * 2.0)+ sin(uv.y / triangleCount + iTime);
    float y2 = mod(uv.x,1.0) + sin(uv.x / triangleCount + iTime + 1.0 * 3.0) + sin(uv.y / triangleCount + iTime);
    y1 *= -1.25;
    vec3 col = color_a + vec3(tri(mod(uv,1.0), y1) * color_b + vec3(tri(mod(uv,1.0), y2)) * color_c);

    // Output to screen
    fragColor = vec4(col, texture(iChannel0, fragCoord / iResolution.xy).a);
}

void main() {
	mainImage(gl_FragColor, openfl_TextureCoordv*openfl_TextureSize);
}