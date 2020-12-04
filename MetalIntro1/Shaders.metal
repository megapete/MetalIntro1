//
//  Shaders.metal
//  MetalIntro1
//
//  Created by Peter Huber on 2020-12-03.
//

#include <metal_stdlib>
#include "ShaderDefinitions.h"
using namespace metal;

struct VertexOut {
    float4 color;
    float4 pos [[position]];
};


vertex VertexOut vertexShader(const device Vertex *vertexArray [[buffer(0)]], unsigned int vid [[vertex_id]])
{
    // Get the data for the current vertex.
    Vertex in = vertexArray[vid];
    
    // PCH: Create space for the result
    VertexOut out;

    // Pass the vertex color directly to the rasterizer
    out.color = in.color;
    
    // Pass the already normalized screen-space coordinates to the rasterizer
    out.pos = float4(in.pos.x, in.pos.y, 0, 1);

    return out;
}

fragment float4 fragmentShader(VertexOut interpolated [[stage_in]])
{
    return interpolated.color;
}
