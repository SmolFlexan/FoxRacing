#version 330 core
out vec4 FragColor;

in vec3 Normal;
in vec3 FragPos;
in vec2 TexCoord;

uniform sampler2D ourTexture;
uniform vec3 objectColor;

void main()
{
    vec4 texColor = texture(ourTexture, TexCoord);
    vec4 baseColor = vec4(texColor.rgb * objectColor, texColor.a);

    vec3 norm = normalize(Normal);
    vec3 lightDir = normalize(vec3(0.0, 1.0, 0.0));
    float diff = max(dot(norm, lightDir), 0.0);

    vec3 ambient = 0.15 * baseColor.rgb;
    vec3 diffuse = diff * baseColor.rgb;

    FragColor = vec4(ambient + diffuse, baseColor.a);
}
