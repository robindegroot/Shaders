Shader "Fixed Unlit"
{
    properties
    {
        _MainTexture("Main Color (RGB) Hello", 2D) = "white"{}
        _Color("color", Color) = (1,1,1,1)
    }
    SubShader
    {

        Pass
        {
            CGPROGRAM
            #pragma vertex vertexFunction
            #pragma fragment fragmentFunction

            #include "UnityCG.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv :TEXCOORD0;
            };
            struct v2f
            {
                float4 position : SV_POSITION;
                float2 uv : TEXCOORD0;
            };
            float4 _Color;
            sampler2D _MainTexture;
            v2f vertexFunction(appdata IN)
            {
                v2f OUT;
                OUT.position = mul(UNITY_MATRIX_MVP, IN.vertex);
                OUT.uv = IN.uv;
                return OUT;
            }
            fixed4 fragmentFunction(v2f IN) : SV_Target
            {
                float4 textureColor = tex2D(_MainTexture, IN.uv);
                return textureColor * _Color;
            }

            ENDCG
        }
    }
}

