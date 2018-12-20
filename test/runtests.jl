using Test
using SCIP

@testset "direct library calls" begin
    include("direct_library_calls.jl")
end

@testset "managed memory" begin
    include("managed_scip.jl")
end
