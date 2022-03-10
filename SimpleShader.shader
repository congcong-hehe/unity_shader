// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// 2022/3/10
// 最简单的shader

// shader name
Shader "Unlit/NewUnlitShader"
{
    SubShader
    {
        Pass
        {
            CGPROGRAM

            struct a2v {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 texcoord : TEXCOORD0;
            };

            struct v2f {
                float4 pos : SV_POSITION;   // 裁剪空间中的位置信息
                fixed3 color : COLOR0;  //存储颜色信息
            };

            #pragma vertex vert // 顶点着色器名字
            #pragma fragment frag   // 片段着色器名字

            v2f vert(a2v v) {
                v2f o;
                o.pos = UnityObjectToClipPos(v.vertex);
                o.color = v.normal * 0.5 + fixed3(0.5, 0.5, 0.5);
                return o;
            }

            fixed4 frag(v2f i) : SV_Target 
            {
                return fixed4(i.color, 1.0);
            }

            ENDCG
        }
    }
}
