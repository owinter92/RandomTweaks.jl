@testset "curve_length" begin
    f(x) = sin(x)

    sol = 3.8201977890277120179047620821714432919099676146472747210804966567
    @test isapprox(curve_length(f,0,pi), sol; atol = 1e-10)
    @test !isapprox(curve_length(f,0,5*pi;rtol=1e-4),5*sol,atol=1e-7)
end


@testset "curve_fraction" begin 
    f(x) = sin(x)

    @test isapprox(curve_fraction(f,0,pi,0.5), pi/2; atol = 1e-10)
    @test !isapprox(curve_fraction(f,0,pi,0.5;rtol=1e-2), pi/2; atol = 1e-9)
end
